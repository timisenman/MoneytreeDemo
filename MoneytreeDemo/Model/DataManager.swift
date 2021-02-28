//
//  DataManager.swift
//  MoneytreeDemo
//
//  Created by Tim Isenman on 2021/02/28.
//

import Foundation

//My otherwise fancy combine solution
class FakeDataManager: NSObject {
    static let shared = FakeDataManager()
    
    public var usersAccounts: [UserAccounts] = [UserAccounts]()
    
    enum CurrencyCode: String { case JPY, USD }
    
    override init() {
        super.init()
        getData()
    }
    
    func getData() {
        let accountData = Bundle.main.decode(AllAccounts.self, from: "accounts.json", keyDecodingStrategy: .convertFromSnakeCase)
        
//        accountData.accounts?.forEach({ (account) in
//            if let accountId = account.id {
//                let transactionList = Bundle.main.decode(TransactionList.self, from: "transactions_\(accountId).json", keyDecodingStrategy: .convertFromSnakeCase)
//                
//                usersAccounts.append(UserAccounts(accountInfo: account, transactionHistory: transactionList))
//            } else {
//                fatalError("File does not exist for Account ID: \(String(describing: account.id))")
//            }
//        })
        
        print("All users accounted for: \(usersAccounts.count)")
    }
    
//    func getTotalBalance(with currency: String = "JPY") -> String {
//        guard !usersAccounts.isEmpty else { fatalError("No users in record") }
//
//        var balance: Double = 0.0
//
//        usersAccounts.forEach { (account) in
//            print(account.accountInfo?.id, account.accountInfo?.currentBalance)
//            if let currentBalance = account.accountInfo?.currentBalance {
//                print("\(account.accountInfo?.institution ?? "No Name"): \(currentBalance)")
//                balance += currentBalance
//            }
//        }
//        let currencyFormatter = CurrencyFormatter()
//        let balanceString = currencyFormatter.formatterdCurrency(for: currency == "JPY" ? .JPY : .USD, and: balance)
//        return balanceString
//    }
    
    func getInOutStatementsOfMoneyFor(account id: Int) -> (in: String, out: String) {
        
        return ("0", "400")
    }
}

//Credit where credit is due: I always borrow this from Hacking With Swift, Paul Hudson. Love generics.
extension Bundle {
    func decode<T: Decodable>(_ type: T.Type, from file: String, dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate, keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = dateDecodingStrategy
        decoder.keyDecodingStrategy = keyDecodingStrategy

        do {
            return try decoder.decode(T.self, from: data)
        } catch DecodingError.keyNotFound(let key, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing key '\(key.stringValue)' not found – \(context.debugDescription)")
        } catch DecodingError.typeMismatch(_, let context) {
            fatalError("Failed to decode \(file) from bundle due to type mismatch – \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let type, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing \(type) value – \(context.debugDescription)")
        } catch DecodingError.dataCorrupted(_) {
            fatalError("Failed to decode \(file) from bundle because it appears to be invalid JSON")
        } catch {
            fatalError("Failed to decode \(file) from bundle: \(error.localizedDescription)")
        }
    }
}
