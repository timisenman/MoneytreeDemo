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



