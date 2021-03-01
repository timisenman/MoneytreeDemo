//
//  CustomTableViewController.swift
//  MoneytreeDemo
//
//  Created by Tim Isenman on 2021/02/28.
//

import UIKit

class SimpleTableViewController: UITableViewController {
    
    var accountsByInstitution: [[Account]]?
    
    
    private let cellId = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: cellId)
        self.tableView.backgroundColor = .clear
        self.tableView.separatorStyle = .none
        
        print("Account Groups")
        if let accountsByInstitution = accountsByInstitution {
            accountsByInstitution.forEach { (accountGroup) in
                print(accountGroup.count)
            }
            
        }
        
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
            print("Account for cell: \(accountForCell)")
            let accountBalance = currenyFormatter.formatterdCurrency(for: .JPY, amount: accountForCell.currentBalance ?? 0)
            cell.amountLabel.text = accountBalance
            cell.cardName.text = accountForCell.nickname ?? "なし"
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let accounts = accountsByInstitution else { fatalError() }
        let header = UIView()
        let title = UILabel()
        
        header.backgroundColor = UIColor.black.withAlphaComponent(0.10)
        header.addSubview(title)
        title.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().inset(10)
            make.centerY.equalToSuperview()
        }
        title.text = accounts[section].first?.institution
        title.textColor = .white
        title.font = UIFont.preferredFont(forTextStyle: .callout)
        
        return header
    }
    

}
