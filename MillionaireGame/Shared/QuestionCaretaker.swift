//
//  QuestionCaretaker.swift
//  MillionaireGame
//
//  Created by Artur Mukhametzyanov on 17.04.2022.
//

import Foundation

final class QuestionCaretaker {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let key = "questions"
    
    func save(questions: [QuestionStructure]) {
        do {
            let data = try self.encoder.encode(questions)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print (error)
        }
    }
    
    func retrieveRecords() -> [QuestionStructure] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        do {
            return try self.decoder.decode([QuestionStructure].self, from: data)
        } catch {
            print (error)
            return []
        }
    }
}
