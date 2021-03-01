//
//  AccountTransactionsViewController.swift
//  MoneytreeDemo
//
//  Created by Tim Isenman on 2021/03/01.
//

import UIKit

class TransactionsTableViewController: UITableViewController {
    var account: Account?
    var transactions: [Transaction]?
    let currencyFormatter = CurrencyFormatter()
    
    private let cellId = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(TransactionTableViewCell.self, forCellReuseIdentifier: cellId)
        self.tableView.backgroundColor = .clear
        
        self.accessibilityLabel = "List of Transactions for Selected Account"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TransactionTableViewCell
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        if let transactions = transactions {
            
            let transaction = transactions[indexPath.row]
            cell.descriptionLabel.text = transaction.description
            cell.descriptionLabel.accessibilityLabel = "Purchase Item: \(String(describing: transaction.description))"
            cell.dateLabel.text = transaction.date
            cell.dateLabel.accessibilityLabel = "Purchase on: \(String(describing: transaction.date))"
            
            let currency = account?.currency ?? "JPY"
            let amount = currencyFormatter.formatterdCurrency(
                for: currency == "JPY" ? .JPY : .USD,
                amount: transaction.amount ?? 0)
            cell.amountLabel.text = amount
            cell.amountLabel.accessibilityLabel = "Amount paid: \(String(describing: amount))"
            
            
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Tapped Item")
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
    }
}
