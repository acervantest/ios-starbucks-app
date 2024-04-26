//
//  ViewController.swift
//  Starbucks
//
//  Created by Alejandro Cervantes on 2024-04-24.
//

import UIKit

class HomeViewController: StarbucksViewController {
    
    let homeHeader = HomeHeaderView()
    var homeHeaderTopConstraint: NSLayoutConstraint?
    
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    
    let tiles = [
            TileView("Star Balance"),
            TileView("Bonus Stars"),
            TileView("Try These"),
            TileView("Welcome Back"),
            TileView("Uplifting")]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBarItem(imageName: "house.fill", title: "Home")
        setUp()
    }
}

extension HomeViewController {
    
    private func setUp() {
        style()
        layout()
        setupScrollView()
    }
    
    func setupScrollView() {
        scrollView.delegate = self
    }
 
    func style() {
        homeHeader.translatesAutoresizingMaskIntoConstraints = false
        homeHeader.backgroundColor = .systemMint
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints  = false
        
        stackView.axis = .vertical
        stackView.spacing = 8
    }
    
    func layout() {
        
        view.addSubview(homeHeader)
        view.addSubview(scrollView)
        
        scrollView.addSubview(stackView)
        
        for tile in tiles {
            addChild(tile)
            stackView.addArrangedSubview(tile.view)
            tile.didMove(toParent: self)
        }
        
        homeHeaderTopConstraint = homeHeader.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        
        NSLayoutConstraint.activate([
            // HEADER VIEW
            homeHeaderTopConstraint!,
            homeHeader.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            homeHeader.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            // SCROLL VIEW
            scrollView.topAnchor.constraint(equalTo: homeHeader.bottomAnchor, constant: 8),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            // STACK VIEW
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
}

// MARK: - Animating Scroll View
extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y
        
        let swipingDown = y <= 0
        let shouldSnap = y > 30
        let labelHeight = homeHeader.greeting.frame.height + 16 // label + spacer
        
        UIView.animate(withDuration: 0.3) {
            self.homeHeader.greeting.alpha = swipingDown ? 1.0 : 0.0
        }
        
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.3, delay: 0, animations: {
            self.homeHeaderTopConstraint?.constant = shouldSnap ? -labelHeight : 0
            self.view.layoutIfNeeded()
        })
    }
}
