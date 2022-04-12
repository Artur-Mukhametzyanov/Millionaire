//
//  Game.swift
//  MillionaireGame
//
//  Created by Artur Mukhametzyanov on 10.04.2022.
//

import Foundation

class Game {
    
    static let shared = Game()
    private let recordsCaretaker = RecordsCaretaker()
    
    var gameSession: GameSession?
    private (set) var recordsArray = [GameSession]() {
        didSet {
            recordsCaretaker.save(records: self.recordsArray)
        }
    }
    
    private init() {
        self.recordsArray = self.recordsCaretaker.retrieveRecords()
    }

    
    //MARK: - добавляем результат в массив
    func addResult(record: GameSession) {
        recordsArray.append(record)
    }
    
}
