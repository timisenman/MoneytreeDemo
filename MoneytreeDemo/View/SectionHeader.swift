//
//  TableViewSectionHeaderView.swift
//  MoneytreeDemo
//
//  Created by Tim Isenman on 2021/03/01.
//

import UIKit

class SectionHeader: UITableViewHeaderFooterView {
    private let header = UIView()
    private let titleLabel = UILabel()
    
    var titleString: String? {
        didSet {
            self.titleLabel.text = titleString
        }
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        self.tintColor = UIColor.black.withAlphaComponent(0.10)
        
        contentView.addSubview(header)
        header.snp.makeConstraints { (make) in
            make.everythingEqualToSuperView()
        }
        
        header.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().inset(10)
            make.centerY.equalToSuperview()
        }
        titleLabel.textColor = .white
        titleLabel.font = UIFont.preferredFont(forTextStyle: .callout)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
