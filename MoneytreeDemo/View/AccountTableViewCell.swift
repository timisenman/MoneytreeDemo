//
//  CustomTableViewCell.swift
//  MoneytreeDemo
//
//  Created by Tim Isenman on 2021/02/28.
//

import UIKit

class AccountTableViewCell: UITableViewCell {
    
    let hStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        return stack
    }()
    var cardName = UILabel()
    var amountLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        
        self.contentView.frame.size = CGSize(width: self.frame.width, height: 44)
        
        self.contentView.addSubview(hStack)
        hStack.addArrangedSubviews(views: [cardName, amountLabel])
        hStack.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(10)
        }
        
        cardName.textColor = .white
        cardName.textAlignment = .left
        cardName.font = UIFont.preferredFont(forTextStyle: .headline)
        
        amountLabel.textColor = .white
        amountLabel.textAlignment = .right
        amountLabel.font = UIFont.preferredFont(forTextStyle: .body)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
