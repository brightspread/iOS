//
//  Quiz.swift
//  QuizApp
//
//  Created by Leo on 2023/07/07.
//

import Foundation

struct QuizDTO: Codable {
    let quizId: Int
    let title: String
    let questions: [QuestionDTO]
}

struct QuestionDTO: Codable {
    let questionId: Int
    let text: String
    let point: Int
    let choices: [ChoiceDTO]
}

struct ChoiceDTO: Codable {
    let choiceId: Int 
    let text: String
    let isCorrect: Bool
}
