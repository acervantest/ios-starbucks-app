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
    
    let cellId = "cellId"
    let tiles = ["Star Balance", "Bonus Stars", "Try These", "Welcome Back", "Uplifting"]

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
    }
 
    func style() {
        homeHeader.translatesAutoresizingMaskIntoConstraints = false
        homeHeader.backgroundColor = .systemMint
    }
    
    func layout() {
        
        view.addSubview(homeHeader)
        
        homeHeaderTopConstraint = homeHeader.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        
        NSLayoutConstraint.activate([
            // HEADER VIEW
            homeHeaderTopConstraint!,
            homeHeader.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            homeHeader.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}

// MARK: - Animating Scroll View
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let y = scrollView.contentOffset.y
//        
//        let swipingDown = y <= 0
//        let shouldSnap = y > 30
//        let labelHeight = homeHeader.greeting.frame.height + 16 // label + spacer
//        
//        UIView.animate(withDuration: 0.3) {
//            self.homeHeader.greeting.alpha = swipingDown ? 1.0 : 0.0
//        }
//        
//        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.3, delay: 0, animations: {
//            self.homeHeaderTopConstraint?.constant = shouldSnap ? -labelHeight : 0
//            self.view.layoutIfNeeded()
//        })
//    }

