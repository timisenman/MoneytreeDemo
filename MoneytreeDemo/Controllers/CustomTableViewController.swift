//
//  CustomTableViewController.swift
//  MoneytreeDemo
//
//  Created by Tim Isenman on 2021/02/28.
//

import UIKit

class SimpleTableViewController: UITableViewController {
    
    let userAccount = FakeDataManager()

    let cellId = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: cellId)
        self.tableView.backgroundColor = .clear
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CustomTableViewCell

        // Configure the cell...
        cell.amountLabel.text = "$1000"
        cell.cardName.text = "カード"
        

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        let title = UILabel()
        
        header.backgroundColor = UIColor.black.withAlphaComponent(0.10)
        header.addSubview(title)
        title.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().inset(10)
            make.centerY.equalToSuperview()
        }
        title.text = "Starbucks \(section)"
        title.textColor = .white
        title.font = UIFont.preferredFont(forTextStyle: .callout)
        
        return header
    }
    

}
