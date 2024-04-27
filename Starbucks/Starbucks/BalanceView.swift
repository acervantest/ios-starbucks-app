//
//  BalanceView.swift
//  Starbucks
//
//  Created by Alejandro Cervantes on 2024-04-27.
//

import UIKit

class BalanceView: UIView {
    
    let pointsLabel = UILabel()
    let starView = makeSymbolImageView(systemName: "star.fill")
    let starBalanceLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func style() {
        pointsLabel.translatesAutoresizingMaskIntoConstraints = false
        pointsLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle).bold()
        pointsLabel.text = "12"
        
        starView.translatesAutoresizingMaskIntoConstraints = false
        starView.tintColor = .starYellow
        starView.contentMode = .scaleAspectFit
        
        starBalanceLabel.translatesAutoresizingMaskIntoConstraints = false
        starBalanceLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        starBalanceLabel.text = "Star balance"
    }
    
    func layout() {
        
        addSubview(pointsLabel)
        addSubview(starView)
        addSubview(starBalanceLabel)

        NSLayoutConstraint.activate([
            // POINTS LABEL
            pointsLabel.topAnchor.constraint(equalTo: topAnchor),
            pointsLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            // STAR VIEW
            starView.leadingAnchor.constraint(equalTo: pointsLabel.trailingAnchor, constant: -2),
            starView.centerYAnchor.constraint(equalTo: pointsLabel.centerYAnchor, constant: 0),
            starView.heightAnchor.constraint(equalToConstant: 15),
            // STAR BALANCE VIEW
            starBalanceLabel.topAnchor.constraint(equalTo: pointsLabel.bottomAnchor),
            starBalanceLabel.leadingAnchor.constraint(equalTo: pointsLabel.leadingAnchor),
            starBalanceLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            starView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

