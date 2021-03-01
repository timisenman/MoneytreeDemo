//
//  TransactionsViewController.swift
//  MoneytreeDemo
//
//  Created by Tim Isenman on 2021/03/01.
//

import UIKit

class TransactionsNavigationController: UINavigationController {
    var transactionsViewController = TransactionsViewController()
    
    init() {
        super.init(rootViewController: transactionsViewController)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

class TransactionsViewController: UIViewController {
    
    let dataManager = FakeDataManager.shared
    let currencyFormatter = CurrencyFormatter()
    
    var accountData: Account?
    var transactions: [Transaction]?
    
    let topSummary = UIView()
    let balanceLabel = UILabel()
    
    var transactionTableView = TransactionsTableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.barTintColor = UIColor(named: "LightOrange")
        self.title = accountData?.institution ?? "Transactions"
        let barButton = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(dismissSelf))
        self.navigationItem.rightBarButtonItems = [barButton]
        
        transactionTableView.transactions = self.transactions
        self.view.addSubview(transactionTableView.tableView)
        transactionTableView.tableView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(60)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //Configure sublayers
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor(named: "LightOrange")?.cgColor ?? UIColor.systemOrange.cgColor,
            UIColor(named: "DarkOrange")?.cgColor ?? UIColor.systemOrange.cgColor]
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        self.view.backgroundColor = UIColor(named: "LightOrange")
        
    }
    
    @objc func dismissSelf() {
        self.dismiss(animated: true) {
            print("Closed Transactions View")
        }
    }
    
}
