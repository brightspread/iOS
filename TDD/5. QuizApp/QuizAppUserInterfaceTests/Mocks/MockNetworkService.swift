//
//  MockNetworkService.swift
//  QuizAppUserInterfaceTests
//
//  Created by Leo on 2023/07/07.
//

import Foundation

class MockNetworkService: NetworkService {
    
    func getAllQuizes(url: URL, completion: @escaping (Result<[QuizDTO], NetworkError>) -> Void) {

        let quizesDTO = QuizData.loadQuizDTOs()
        completion(.success(quizesDTO))
    }
    
    func getQuizById(url: URL, completion: @escaping (Result<QuizDTO, NetworkError>) -> Void) {

        let quizesDTO = QuizData.loadQuizDTOs()
        let quizDTO = quizesDTO.first { $0.quizId == 1 }!
        
        completion(.success(quizDTO))
    }

}
