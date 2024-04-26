//
//  ViewController.swift
//  Starbucks
//
//  Created by Alejandro Cervantes on 2024-04-24.
//

import UIKit

class HomeViewController: StarbucksViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setTabBarItem(imageName: "house.fill", title: "Home")
        
    }

    func setupNavBar() {
        navigationController?.navigationBar.topItem?.title = "Good afternoon, Alejandro"
    }

}

