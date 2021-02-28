//
//  UIHelpers.swift
//  MoneytreeDemo
//
//  Created by Tim Isenman on 2021/02/28.
//

import SnapKit

extension ConstraintMaker {
    func everythingEqualToSuperView () {
        self.size.equalToSuperview()
        self.center.equalToSuperview()
    }

    func pinAllEdges (withInsets insets: UIEdgeInsets?, respectingSafeAreaLayoutGuidesOfView view : UIView?) {
        let insets = insets ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

        if let v = view {
            self.top.equalTo(v.safeAreaLayoutGuide.snp.top).inset(insets).priority(999)
            self.bottom.equalTo(v.safeAreaLayoutGuide.snp.bottom).inset(insets).priority(999)
            self.leading.equalTo(v.safeAreaLayoutGuide.snp.leading).inset(insets).priority(999)
            self.trailing.equalTo(v.safeAreaLayoutGuide.snp.trailing).inset(insets).priority(999)
        } else {
            self.top.equalToSuperview().inset(insets).priority(998)
            self.bottom.equalToSuperview().inset(insets).priority(998)
            self.left.equalToSuperview().inset(insets).priority(998)
            self.right.equalToSuperview().inset(insets).priority(998)
        }
    }

    func pinAllEdgesToSuperView () {
        self.top.equalToSuperview()
        self.left.equalToSuperview()
        self.right.equalToSuperview()
        self.bottom.equalToSuperview()
    }
}

extension UIStackView {
    func addArrangedSubviews (views : [UIView]) {
        for view in views {
            self.addArrangedSubview(view)
        }
    }
    
    func insertVerticalSpacerView(ofHeight height : CGFloat) {
        let spacerView = UIView()
        spacerView.backgroundColor = .clear
        self.addArrangedSubview(spacerView)
        
        spacerView.snp.makeConstraints { make in
            make.width.equalTo(self.snp.width)
            make.height.equalTo(height)
        }
    }
    
    func insertHorizontalSpacerView(ofWidth width : CGFloat) {
        let spacerView = UIView()
        spacerView.backgroundColor = .clear
        self.addArrangedSubview(spacerView)
        
        spacerView.snp.makeConstraints { make in
            make.height.equalTo(self.snp.height)
            make.width.equalTo(width)
        }
    }
    
    func insertVerticalDivider(strokeWidth : CGFloat, color : UIColor, insets : UIEdgeInsets) {
        let containerView = UIView()
        containerView.backgroundColor = .clear
        self.addArrangedSubview(containerView)
        
        containerView.snp.makeConstraints { make in
            make.height.equalTo(strokeWidth + insets.top + insets.bottom)
            make.width.equalToSuperview()
        }
        
        let dividerView = UIView()
        dividerView.backgroundColor = color
        containerView.addSubview(dividerView)
        
        dividerView.snp.makeConstraints { make in
            make.height.equalTo(strokeWidth)
            make.left.equalToSuperview().inset(insets)
            make.right.equalToSuperview().inset(insets)
            make.top.equalToSuperview().inset(insets)
            make.bottom.equalToSuperview().inset(insets)
        }
    }
}
