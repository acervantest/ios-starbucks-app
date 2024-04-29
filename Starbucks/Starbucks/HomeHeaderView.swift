//
//  HomeHeaderView.swift
//  Starbucks
//
//  Created by Alejandro Cervantes on 2024-04-25.
//

import UIKit

protocol HomeHeaderViewDelegate: AnyObject {
    func didTapHistoryButton(_ sender: HomeHeaderView)
}

class HomeHeaderView: UIView {
    
    let greeting = UILabel()
    let inboxButton = UIButton()
    let historyButton = UIButton()
    
    weak var delegate: HomeHeaderViewDelegate?
    
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
        backgroundColor = .white
        
        greeting.translatesAutoresizingMaskIntoConstraints = false
        greeting.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        greeting.text = "Good Afternoon, Alejandro"
        greeting.numberOfLines = 0
        greeting.lineBreakMode = .byWordWrapping
        
        makeInboxButton()
        
        makeHistoryButton()
        
        historyButton.addTarget(self, action: #selector(historyButtonTapped(sender:)), for: .primaryActionTriggered)
    }
    
    func layout() {
        addSubview(greeting)
        addSubview(inboxButton)
        addSubview(historyButton)
        
        
        NSLayoutConstraint.activate([
            // LABEL
            greeting.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            greeting.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: greeting.trailingAnchor, multiplier: 1),
            // INBOX BUTTON
            inboxButton.topAnchor.constraint(equalToSystemSpacingBelow: greeting.bottomAnchor, multiplier: 2),
            inboxButton.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            inboxButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.25),
            bottomAnchor.constraint(equalToSystemSpacingBelow: inboxButton.bottomAnchor, multiplier: 1),
            // HISTORY BUTTON
            historyButton.leadingAnchor.constraint(equalToSystemSpacingAfter: inboxButton.trailingAnchor, multiplier: 2),
            historyButton.centerYAnchor.constraint(equalTo: inboxButton.centerYAnchor),
            historyButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.25)
        ])
    }
}

// MARK: - Factories

extension HomeHeaderView {
    
    func makeInboxButton() {
        makeButton(button: inboxButton, systemName: "envelope", text: "Inbox")
    }
    
    func makeHistoryButton() {
        makeButton(button: historyButton, systemName: "calendar", text: "History")
    }
    
    func makeButton(button: UIButton, systemName: String, text: String) {
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: systemName, withConfiguration: configuration)
        
        button.setImage(image, for: .normal)
        button.imageView?.tintColor = .secondaryLabel
        button.imageView?.contentMode = .scaleAspectFit
        
        button.setTitle(text, for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16)
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

// MARK: - Actions

extension HomeHeaderView {
    @objc func historyButtonTapped(sender: UIButton) {
        delegate?.didTapHistoryButton(self)
    }
}
