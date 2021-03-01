//
//  CurrencyHelper.swift
//  MoneytreeDemo
//
//  Created by Tim Isenman on 2021/02/28.
//

import Foundation

struct CurrencyFormatter {
    
    enum CurrencyCode: String {
        case JPY, USD
    }
    
    func formatterdCurrency(for code: CurrencyCode, amount: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = code.rawValue

        return formatter.string(from: NSNumber(value: amount)) ?? "N/A"
    }
    
}
