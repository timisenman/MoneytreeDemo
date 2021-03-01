//
//  TransactionCell.swift
//  MoneytreeDemo
//
//  Created by Tim Isenman on 2021/03/01.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {
    
    let vStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        return stack
    }()
    let hStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        return stack
    }()
    
    private let descriptionContainer = UIView()
    public var descriptionLabel = UILabel()
    private let dateContainer = UIView()
    public var dateLabel = UILabel()
    private let amountContainer = UIView()
    public var amountLabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        
        self.contentView.frame.size = CGSize(width: self.frame.width, height: 70)
        
        self.contentView.addSubview(hStack)
        hStack.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(10)
        }
        hStack.addArrangedSubviews(views: [vStack, amountContainer])
        
        vStack.addArrangedSubviews(views: [descriptionContainer, dateContainer])
        
        descriptionContainer.addSubview(descriptionLabel)
        descriptionLabel.textColor = UIColor.white
        descriptionLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        descriptionLabel.textAlignment = .left
        descriptionLabel.lineBreakMode = .byCharWrapping
        descriptionLabel.numberOfLines = .zero
        descriptionLabel.snp.makeConstraints { (make) in
            make.pinAllEdgesToSuperView()
        }
        
        dateContainer.addSubview(dateLabel)
        dateLabel.textColor = UIColor.white
        dateLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        dateLabel.textAlignment = .left
        dateLabel.snp.makeConstraints { (make) in
            make.pinAllEdgesToSuperView()
        }
        
        amountContainer.addSubview(amountLabel)
        amountLabel.textColor = UIColor.white
        amountLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        amountLabel.textAlignment = .right
        amountLabel.snp.makeConstraints { (make) in
            make.pinAllEdgesToSuperView()
        }
        
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
