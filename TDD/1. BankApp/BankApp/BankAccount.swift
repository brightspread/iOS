//
//  BankAccount.swift
//  BankApp
//
//  Created by Leo on 2023/06/30.
//

import Foundation

enum BankError: Error {
    case insufficientFunds
}

class BankAccount {
    
    var accountNumber: String
    var balance: Double
    
    init(accountNumber: String, amount: Double) {
        self.accountNumber = accountNumber
        self.balance = amount
    }
    
    func deposit(_ amount: Double) {
        self.balance += amount
    }
    
    func withdraw(_ amount: Double) throws {
        
        if amount > self.balance {
            throw BankError.insufficientFunds
        }
        
        self.balance -= amount 
    }
}
