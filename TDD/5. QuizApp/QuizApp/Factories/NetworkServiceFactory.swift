//
//  NetworkServiceFactory.swift
//  QuizApp
//
//  Created by Leo on 2023/07/07.
//

import Foundation

class NetworkServiceFactory {
    
    static func create() -> NetworkService {
        
        let environment = ProcessInfo.processInfo.environment["ENV"]
        if let environment = environment {
            if environment == "TEST" {
                return MockNetworkService()
            } else {
                return Webservice()
            }
        }
        
        return Webservice()
    }
 
}
