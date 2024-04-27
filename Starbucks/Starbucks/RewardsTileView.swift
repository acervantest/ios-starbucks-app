//
//  RewardsTileView.swift
//  Starbucks
//
//  Created by Alejandro Cervantes on 2024-04-27.
//

import UIKit

class RewardsTileView: UIView {
    
    let balanceView = BalanceView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 100, height: 300)
    }
}

extension RewardsTileView {
    
    func setup() {
        style()
        layout()
    }
    
    func style() {
        balanceView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func layout() {
        addSubview(balanceView)
        
        NSLayoutConstraint.activate([
            balanceView.topAnchor.constraint(equalTo: topAnchor),
            balanceView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2)
        ])
    }
}
