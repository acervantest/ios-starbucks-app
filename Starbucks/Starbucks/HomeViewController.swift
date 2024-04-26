//
//  ViewController.swift
//  Starbucks
//
//  Created by Alejandro Cervantes on 2024-04-24.
//

import UIKit

class HomeViewController: StarbucksViewController {
    
    let homeHeader = HomeHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        setTabBarItem(imageName: "house.fill", title: "Home")
        style()
        layout()
    }

    func setupNavBar() {
        navigationController?.navigationBar.topItem?.title = "Good afternoon, Alejandro"
    }
}

extension HomeViewController {
    func style(){
        homeHeader.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func layout(){
        view.addSubview(homeHeader)
        
        NSLayoutConstraint.activate([
            homeHeader.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            homeHeader.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            homeHeader.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

