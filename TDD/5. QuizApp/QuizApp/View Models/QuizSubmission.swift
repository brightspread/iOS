//
//  QuizSubmission.swift
//  QuizApp
//
//  Created by Leo on 2023/07/07.
//

import Foundation

struct QuizSubmission {
    
    let quizId: Int
    private (set) var selectedChoices: [Int: Int] = [:]
    
    init(quizId: Int) {
        self.quizId = quizId
    }
    
    func isSelected(questionId: Int, choiceId: Int) -> Bool {
        
        if let persistedChoiceId = selectedChoices[questionId] {
            return choiceId == persistedChoiceId
        }
        
        return false
    }
    
    mutating func addChoice(questionId: Int, choiceId: Int) {
        self.selectedChoices[questionId] = choiceId
    }
}

