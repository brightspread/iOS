//
//  GradeViewModel.swift
//  QuizApp
//
//  Created by Leo on 2023/07/07.
//

import Foundation

class QuizGradeViewModel: ObservableObject {
    
    var networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func submitQuiz(submission: QuizSubmission) {
        
        networkService.getQuizById(url: Constants.Urls.quizById(submission.quizId)) { result in
            switch result {
                case .success(let quizDTO):
                    print(quizDTO)
                case .failure(let error):
                    print(error)
            }
        }
    }
    
}


