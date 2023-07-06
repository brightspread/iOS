//
//  MockWebservice.swift
//  MockingDemoUserInterfaceTests
//
//  Created by Leo on 2023/07/06.
//

import Foundation

class MockWebservice: NetworkService {
    func login(username: String, password: String, completion: @escaping (Result<Void, NetworkError>) -> Void) {
        
        if username == "JohnDoe" && password == "Password" {
            completion(.success(()))
        } else {
            completion(.failure(.notAuthenticated))
        }
    }
}
