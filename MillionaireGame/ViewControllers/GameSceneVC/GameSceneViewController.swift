//
//  GameSceneViewController.swift
//  MillionaireGame
//
//  Created by Artur Mukhametzyanov on 10.04.2022.
//

import UIKit


class GameSceneViewController: UIViewController {
    
    @IBOutlet weak var questionTextLabel: UILabel!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var fourthButton: UIButton!
    @IBOutlet weak var answeredQuestionsCount: UILabel!
    
    var questionNumber = 0
    var gameSession = GameSession()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        firstScreenPreparing()
    }
    
    @IBAction func firstButtonTapped(_ sender: Any) {
        clickButton(sender: firstButton)
    }
    
    @IBAction func secondButtonTapped(_ sender: Any) {
        clickButton(sender: secondButton)
    }
    
    @IBAction func thirdButtonTapped(_ sender: Any) {
        clickButton(sender: thirdButton)
    }
    
    @IBAction func fourthButtonTapped(_ sender: Any) {
        clickButton(sender: fourthButton)
    }
}

extension GameSceneViewController {
    
    func setupViews() {
        firstButton.tag = 1
        secondButton.tag = 2
        thirdButton.tag = 3
        fourthButton.tag = 4
        
        questionTextLabel.layer.cornerRadius = 10
        questionTextLabel.clipsToBounds = true
        
        answeredQuestionsCount.text = "\(questionNumber)/\(questionsArray.count)"
    }
    
    func firstScreenPreparing() {
        questionTextLabel.text = questionsArray[questionNumber].questionText
        firstButton.setTitle(questionsArray[questionNumber].answerText1, for: .normal)
        secondButton.setTitle(questionsArray[questionNumber].answerText2, for: .normal)
        thirdButton.setTitle(questionsArray[questionNumber].answerText3, for: .normal)
        fourthButton.setTitle(questionsArray[questionNumber].answerText4, for: .normal)
    }
    
    func clickButton (sender: UIButton) {

        let record = GameSession(answeredQuestionCount: gameSession.answeredQuestionCount, date: Date())
        
        // Правильное нажатие на вопросы кроме последнего
        if sender.tag == questionsArray[questionNumber].questionsAnswerNumber && questionNumber < questionsArray.count - 1 {
            questionNumber += 1
            gameSession.answeredQuestionCount = questionNumber
            viewDidLoad()

        // Правильное нажатие на последний вопрос
        } else if sender.tag == questionsArray[questionNumber].questionsAnswerNumber && questionNumber == (questionsArray.count - 1) {
            let record = GameSession(answeredQuestionCount: questionsArray.count, date: Date())
            Game.shared.addResult(record: record)
            navigationController?.popViewController(animated: true)
            
        // Неправильное нажатие
        } else {
            Game.shared.addResult(record: record)
            navigationController?.popViewController(animated: true)
        }
    }
}
