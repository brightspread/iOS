//
//  NetworkServiceFactory.swift
//  MockingDemo
//
//  Created by Leo on 2023/07/06.
//

import Foundation
// MockService / 실제 Network service 만들지 결정

class NetworkServiceFactory {
    static func create() -> NetworkService {
        let environment = ProcessInfo.processInfo.environment["ENV"]
        if let environment = environment {
            if environment == "TEST" {
                return MockWebservice()
            } else {
                return Webservice()
            }
        } else {
            return Webservice()
        }
    }
}
