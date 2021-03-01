//
//  DataModel.swift
//  MoneytreeDemo
//
//  Created by Tim Isenman on 2021/02/28.
//

import Foundation

struct UserAccounts: Codable {
    let accountsList: AllAccounts?
    let transactionsPerAccount: [TransactionsPerAccount]?
    
    
//    //numberOfAccounts
//    var uniqueInstitutions: [String] {
//        guard let accounts = accountsList?.accounts else { fatalError("No Accounts") }
//        var accountNames  = [String]()
//        accounts.forEach { (account) in
//            if let institution = account.institution {
//                accountNames.append(institution)
//            }
//        }
//        let uniqueNames = Set(accountNames)
//        return Array(uniqueNames)
//    }
//    
//    var institutionsCount: Int {
//        return uniqueInstitutions.count
//    }
//    
//    var accountsForInstitutions: [[Account]] {
//        
//        let institutionsArray = Array(uniqueInstitutions)
//        guard let accounts = accountsList?.accounts else { fatalError("No Accounts") }
//        var allAccountsArray = [[Account]]()
//        
//        print("institutes: \(institutionsArray.count)")
//        for institute in institutionsArray {
////            print(institute)
//            var instituteArray = [Account]()
//            for a in accounts {
//                
//                if (a.institution ?? "") == institute {
//                    instituteArray.append(a)
//                    print(a.institution, institute)
//                }
//            }
//            print("Current inst. count: \(allAccountsArray.count)")
//            allAccountsArray.append(instituteArray)
//        }
//        
//        return allAccountsArray
//        
////        print(allAccountsArray.count)
//        
//    }
}

struct AllAccounts: Codable {
    let accounts: [Account]?
}

struct Account: Codable {
    let id: Int?
    let nickname: String?
    let institution: String?
    let currency: String?
    let currentBalance: Double?
    let currentBalanceInBase: Double?
}

struct TransactionsPerAccount: Codable {
    let transactions: [Transaction]?
}

struct Transaction: Codable {
    let accountId: Int?
    let amount: Double?
    let categoryId: Int?
    let date: String?
    let description: String?
    let id: Int?
}



