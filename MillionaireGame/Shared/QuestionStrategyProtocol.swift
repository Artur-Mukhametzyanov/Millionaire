//
//  QuestionStrategyProtocol.swift
//  MillionaireGame
//
//  Created by Artur Mukhametzyanov on 13.04.2022.
//

import Foundation

protocol QuestionStrategyProtocol {
    func questionsOrder() -> [QuestionStructure]
}

class RandomQuestions: QuestionStrategyProtocol {
    
    func questionsOrder() -> [QuestionStructure] {
        let newArray = Game.shared.questionsArray.shuffled()
        return newArray
    }
}

class SequenceQuestions: QuestionStrategyProtocol {

    func questionsOrder() -> [QuestionStructure] {
        let newArray = Game.shared.questionsArray
        return newArray 
    }
}





