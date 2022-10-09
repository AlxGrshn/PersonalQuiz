//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 06.10.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    @IBOutlet var chosenAnimalTF: UILabel!
    @IBOutlet var chosenAnimalDescriptionTF: UILabel!
    
    var answersChosen: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        chosenAnimalTF.text = "ВЫ - \(getAnswersResult().rawValue)"
        chosenAnimalDescriptionTF.text = "\(getAnswersResult().definition)"
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    
    private func getAnswersResult() -> Animal {
        var answers = answersChosen
        
        answers.sort { (lhs: Answer, rhs: Answer) -> Bool in
            return lhs.animal.rawValue  < rhs.animal.rawValue
        }
        
        var maxCount = 0
        var maxAnimal : Animal = answers[0].animal
        var currentCount = 0
        let currentAnimal : Animal = answers[0].animal
        
        for answer in answers {
            if answer.animal.rawValue == currentAnimal.rawValue {
                currentCount = currentCount + 1
            } else {
                if currentCount > maxCount {
                    maxCount = currentCount
                    maxAnimal = answer.animal
                } else {
                    currentCount = 0
                }
            }
        }
        return maxAnimal
    }
}
