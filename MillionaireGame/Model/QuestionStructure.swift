//
//  QuestionStructure.swift
//  MillionaireGame
//
//  Created by Artur Mukhametzyanov on 07.04.2022.
//

import Foundation

struct QuestionStructure {
    
    var questionText: String
    var answerText1: String
    var answerText2: String
    var answerText3: String
    var answerText4: String
    var questionsAnswerNumber: Int
    
}

var questionsArray: [QuestionStructure] = [

    QuestionStructure(questionText: "1. Откуда сотрудники офисов наливают в чашки воду?", answerText1: "Из принтера", answerText2: "Из сканера", answerText3: "Из степлера", answerText4: "Из кулера", questionsAnswerNumber: 4),
    QuestionStructure(questionText: "2. Что построил Джек в стихотворении, переведенном с английского Маршаком?", answerText1: "Маршрут", answerText2: "График", answerText3: "Дом", answerText4: "Коммунизм", questionsAnswerNumber: 3),
    QuestionStructure(questionText: "3. Что может возникнуть на шахматной доске?", answerText1: "Вечный шах", answerText2: "Вечный мат", answerText3: "Вечный зов", answerText4: "Вечный двигатель", questionsAnswerNumber: 1),
    QuestionStructure(questionText: "4. Что такое каршеринг?", answerText1: "Секонд-хенд", answerText2: "Напольный светильник", answerText3: "Брачный танец вороны", answerText4: "Аренда автомобиля", questionsAnswerNumber: 4),
    QuestionStructure(questionText: "5. Какие мужчины, согласно этикету, не обязаны идти слева от дамы?", answerText1: "Высокие", answerText2: "Пожилые", answerText3: "Иногородние", answerText4: "Военные", questionsAnswerNumber: 4),

]
