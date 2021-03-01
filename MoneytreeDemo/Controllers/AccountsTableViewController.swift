//
//  CustomTableViewController.swift
//  MoneytreeDemo
//
//  Created by Tim Isenman on 2021/02/28.
//

import UIKit

class AccountsTableViewController: UITableViewController {
    
    var accountsByInstitution: [[Account]]?
    
    private let cellId = "cell"
    private let sectionId = "section"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.register(SectionHeader.self, forHeaderFooterViewReuseIdentifier: sectionId)
        self.tableView.backgroundColor = .clear
        self.tableView.separatorStyle = .none
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        guard let accountsByInstitution = accountsByInstitution else { return 0 }
        return accountsByInstitution.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //[[Accounts]]
        guard let accountsByInstitution = accountsByInstitution else { return 0 }
        return accountsByInstitution[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CustomTableViewCell
        let currenyFormatter = CurrencyFormatter()
        
        if let accountsByInstitution = accountsByInstitution {
            
            guard !accountsByInstitution[indexPath.item].isEmpty else { fatalError() }
            
            let accountForCell = accountsByInstitution[indexPath.section][indexPath.row]
            let accountBalance = currenyFormatter.formatterdCurrency(for: .JPY, amount: accountForCell.currentBalance ?? 0)
            cell.amountLabel.text = accountBalance
            cell.cardName.text = accountForCell.nickname ?? "なし"
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: sectionId) as! SectionHeader
        guard let accounts = accountsByInstitution else { fatalError() }
        header.titleString = accounts[section].first?.institution
        return header
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Tapped")
        
        guard let accountsByInstitution = accountsByInstitution else { return }
        
        print(accountsByInstitution.count)
        guard !accountsByInstitution[indexPath.item].isEmpty else { fatalError() }
        let accountAtRow = accountsByInstitution[indexPath.section][indexPath.row]
        
        let transactionsNavController = TransactionsNavigationController()
        transactionsNavController.modalPresentationStyle = .automatic
        transactionsNavController.transactionsViewController.accountData = accountAtRow
        
        self.navigationController?.present(transactionsNavController, animated: true, completion: {
            print("Presented from Nav")
        })
        
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
    }
    
    

}
