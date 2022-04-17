//
//  NewQuestionViewController.swift
//  MillionaireGame
//
//  Created by Artur Mukhametzyanov on 17.04.2022.
//

import UIKit

class NewQuestionViewController: UIViewController {
    
    @IBOutlet weak var questionText: UITextField!
    @IBOutlet weak var answerA: UITextField!
    @IBOutlet weak var answerB: UITextField!
    @IBOutlet weak var answerC: UITextField!
    @IBOutlet weak var answerD: UITextField!
    @IBOutlet weak var rightQuestionNumber: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveButton(_ sender: Any) {
        addQuestion()
    }
}

extension NewQuestionViewController {
    
    func addQuestion() {
        
        let newQuestion = QuestionStructure(questionText: questionText.text!, answerText1: answerA.text!, answerText2: answerB.text!, answerText3: answerC.text!, answerText4: answerD.text!, questionsAnswerNumber: Int(rightQuestionNumber.text!)!)
        Game.shared.questionsArray.append(newQuestion)
        questionText.text = ""
        answerA.text = ""
        answerB.text = ""
        answerC.text = ""
        answerD.text = ""
        rightQuestionNumber.text = ""
    }
}
