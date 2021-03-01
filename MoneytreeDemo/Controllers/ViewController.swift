//
//  ViewController.swift
//  MoneytreeDemo
//
//  Created by Tim Isenman on 2021/02/28.
//

import UIKit
import SnapKit

class MainNavigationController: UINavigationController {
    var viewController = ViewController()
    
    init() {
        super.init(rootViewController: viewController)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

class ViewController: UIViewController {

    private let accountData = FakeDataManager.shared
    
    private let contentView = UIView()
    
    private let accountsBalanceContainer = UIView()
    private let digitalMoneyTitleLabel = UILabel()
    private let totalBalanceLable = UILabel()
    
    private var accountsTableView = AccountsTableViewController()
    
    private let addDigitalMoneyButton = UIView() //will be a button
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isTranslucent = true
        self.title = "Balances"
        self.view.backgroundColor = UIColor(white: 0.95, alpha: 1)
        
        
        let button = UIButton(type: UIButton.ButtonType.custom)
        button.setImage(UIImage(systemName: "gearshape"), for: .normal)
        button.addTarget(self, action:#selector(self.openSettings), for: .touchDown)
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItems = [barButton]
        
        self.view.addSubview(contentView)
        contentView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(75)
            make.leading.equalToSuperview().inset(12)
            make.trailing.equalToSuperview().inset(12)
            make.bottom.equalToSuperview().inset(12)
        }
        
        
        self.contentView.addSubview(accountsBalanceContainer)
        accountsBalanceContainer.snp.makeConstraints { (make) in
            make.top.equalTo(contentView.snp.top)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.2).priorityHigh() // top 1/5th of view == 20%
        }
        
        let balanceContainerVStack = UIStackView()
        balanceContainerVStack.axis = .vertical
        accountsBalanceContainer.addSubview(balanceContainerVStack)
        balanceContainerVStack.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(10)
        }
        
        let digitalMoneyContainer = UIView()
        let digitalMoneyLabel = UILabel()
        digitalMoneyLabel.text = "Digital Money"
        digitalMoneyLabel.accessibilityLabel = "Digital Money"
        digitalMoneyLabel.textAlignment = .left
        digitalMoneyLabel.textColor = .white
        digitalMoneyLabel.adjustsFontForContentSizeCategory = true
        digitalMoneyLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        digitalMoneyContainer.addSubview(digitalMoneyLabel)
        digitalMoneyLabel.snp.makeConstraints { (make) in
            make.everythingEqualToSuperView()
        }
        balanceContainerVStack.addArrangedSubview(digitalMoneyContainer)
        
        let balanceContainer = UIView()
        let balanceLabel = UILabel()
        balanceLabel.text = accountData.getTotalBalance()
        balanceLabel.accessibilityLabel = accountData.getTotalBalance()
        balanceLabel.textAlignment = .left
        balanceLabel.textColor = .white
        balanceLabel.adjustsFontForContentSizeCategory = true
        balanceLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        balanceContainer.addSubview(balanceLabel)
        balanceLabel.snp.makeConstraints { (make) in
            make.everythingEqualToSuperView()
        }
        balanceContainerVStack.addArrangedSubview(balanceContainer)
        
        let tableViewContainer = UIView()
        contentView.addSubview(tableViewContainer)
        tableViewContainer.snp.makeConstraints { (make) in
            make.top.equalTo(accountsBalanceContainer.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        self.addChild(accountsTableView)
        tableViewContainer.addSubview(accountsTableView.tableView)
        accountsTableView.tableView.snp.makeConstraints { (make) in
            make.everythingEqualToSuperView()
        }
        
        //inject data dependency to tableview
        accountsTableView.accountsByInstitution = accountData.accountsByInstitution
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //Configure sublayers
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor(named: "LightOrange")?.cgColor ?? UIColor.systemOrange.cgColor,
            UIColor(named: "DarkOrange")?.cgColor ?? UIColor.systemOrange.cgColor]
        gradientLayer.frame = contentView.bounds
        contentView.layer.insertSublayer(gradientLayer, at: 0)
        contentView.backgroundColor = UIColor(named: "LightOrange")
        
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 15
        contentView.layer.cornerCurve = .continuous
    }

    @objc func openSettings() {
        print("Dismissing")
    }

}



