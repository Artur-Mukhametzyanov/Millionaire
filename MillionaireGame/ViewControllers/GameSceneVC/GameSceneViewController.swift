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
    let newArray = Game.shared.returnRequestedArray()
    
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
        
        answeredQuestionsCount.text = "\(questionNumber)/\(Game.shared.questionsArray.count)"
    }
    
    func firstScreenPreparing() {
        questionTextLabel.text = newArray[questionNumber].questionText
        firstButton.setTitle(newArray[questionNumber].answerText1, for: .normal)
        secondButton.setTitle(newArray[questionNumber].answerText2, for: .normal)
        thirdButton.setTitle(newArray[questionNumber].answerText3, for: .normal)
        fourthButton.setTitle(newArray[questionNumber].answerText4, for: .normal)
    }
    
    func clickButton (sender: UIButton) {

        let record = GameSession(answeredQuestionCount: gameSession.answeredQuestionCount, date: Date())
        
        // ???????????????????? ?????????????? ???? ?????????????? ?????????? ????????????????????
        if sender.tag == newArray[questionNumber].questionsAnswerNumber && questionNumber < newArray.count - 1 {
            questionNumber += 1
            gameSession.answeredQuestionCount = questionNumber
            viewDidLoad()

        // ???????????????????? ?????????????? ???? ?????????????????? ????????????
        } else if sender.tag == newArray[questionNumber].questionsAnswerNumber && questionNumber == (newArray.count - 1) {
            let record = GameSession(answeredQuestionCount: Game.shared.questionsArray.count, date: Date())
            Game.shared.addResult(record: record)
            navigationController?.popViewController(animated: true)
            
        // ???????????????????????? ??????????????
        } else {
            Game.shared.addResult(record: record)
            navigationController?.popViewController(animated: true)
        }
    }
}
