//
//  HomeHeaderView.swift
//  Starbucks
//
//  Created by Alejandro Cervantes on 2024-04-25.
//

import UIKit

class HomeHeaderView: UIView {
    
    let greeting = UILabel()
    let inboxButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeHeaderView {
    func style() {
        greeting.translatesAutoresizingMaskIntoConstraints = false
        greeting.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        greeting.text = "Good Afternoon, Alejandro"
        greeting.numberOfLines = 0
        greeting.lineBreakMode = .byWordWrapping
        
        makeInboxButton()
    }
    
    func layout() {
        addSubview(greeting)
        addSubview(inboxButton)
        
        // LABEL
        NSLayoutConstraint.activate([
            greeting.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            greeting.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: greeting.trailingAnchor, multiplier: 1)
        ])
        
        // BUTTON
        NSLayoutConstraint.activate([
            inboxButton.topAnchor.constraint(equalToSystemSpacingBelow: greeting.bottomAnchor, multiplier: 2),
            inboxButton.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: inboxButton.bottomAnchor, multiplier: 1)
        ])
    }
}

// MARK: - Factories
extension HomeHeaderView {
    
    func makeInboxButton() {
        
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: "envelope", withConfiguration: configuration)
        
        inboxButton.translatesAutoresizingMaskIntoConstraints = false
        
        inboxButton.setImage(image, for: .normal)
        inboxButton.imageView?.tintColor = .secondaryLabel
        inboxButton.imageView?.contentMode = .scaleAspectFit
        
        inboxButton.setTitleColor(.secondaryLabel, for: .normal)
        inboxButton.setTitle("Inbox", for: .normal)
    }
}
