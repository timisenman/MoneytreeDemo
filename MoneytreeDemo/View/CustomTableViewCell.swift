//
//  CustomTableViewCell.swift
//  MoneytreeDemo
//
//  Created by Tim Isenman on 2021/02/28.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    var cardName = UILabel()
    var amountLabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        
        self.contentView.addSubview(cardName)
        cardName.textColor = .white
        cardName.font = UIFont.preferredFont(forTextStyle: .headline)
        cardName.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().inset(10)
            make.centerY.equalToSuperview()
        }
        
        self.contentView.addSubview(amountLabel)
        amountLabel.textColor = .white
        amountLabel.font = UIFont.preferredFont(forTextStyle: .body)
        amountLabel.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().inset(10)
            make.centerY.equalToSuperview()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
