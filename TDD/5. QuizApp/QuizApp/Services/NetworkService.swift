//
//  NetworkService.swift
//  QuizApp
//
//  Created by Leo on 2023/07/07.
//

import Foundation

protocol NetworkService {
    func getAllQuizes(url: URL, completion: @escaping (Result<[QuizDTO], NetworkError>) -> Void)
    func getQuizById(url: URL, completion: @escaping (Result<QuizDTO, NetworkError>) -> Void)
}
