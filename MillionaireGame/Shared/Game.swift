//
//  Game.swift
//  MillionaireGame
//
//  Created by Artur Mukhametzyanov on 10.04.2022.
//

import Foundation

class Game {
    
    var gameSession: GameSession?
    private let recordsCaretaker = RecordsCaretaker()
    private let questionsCaretaker = QuestionCaretaker()
    static let shared = Game()
    var questionsArray: [QuestionStructure] = []
    
    var recordsArray = [GameSession]() {
        didSet {
            recordsCaretaker.save(records: self.recordsArray)
        }
    }
        
    var arrayFromMemory = [QuestionStructure]() {
        didSet {
            questionsCaretaker.save(questions: self.arrayFromMemory)
        }
    }
    
    private init() {
        self.recordsArray = self.recordsCaretaker.retrieveRecords()
        self.arrayFromMemory = self.questionsCaretaker.retrieveRecords()
        questionsArray = defaultQuestions + arrayFromMemory
    }

    //MARK: - добавляем результат в массив
    func addResult(record: GameSession) {
        recordsArray.append(record)
    }
    
    //MARK: - Получаем стратегию и отдаем необходимый массив: последовательный или перемешанный
    var questionOrder: QuestionsOrder = .sequence
    var strategyInstance: QuestionStrategyProtocol?
    
    private var createArrayStrategy: QuestionStrategyProtocol {
        switch questionOrder {
        case .sequence:
            return SequenceQuestions()
        case .random:
            return RandomQuestions()
        }
    }
    
    func returnRequestedArray() -> [QuestionStructure] {
        
        strategyInstance = createArrayStrategy
        return (strategyInstance?.questionsOrder())!
    }
}
