//
//  ViewController.swift
//  Starbucks
//
//  Created by Alejandro Cervantes on 2024-04-24.
//

import UIKit

class HomeViewController: StarbucksViewController {
    
    let homeHeader = HomeHeaderView()
    let tableView = UITableView()
    
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
        setupTableView()
    }
 
    func style() {
        homeHeader.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.tableFooterView = UIView()
    }
    
    func layout() {
        
        view.addSubview(homeHeader)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            // HEADER VIEW
            homeHeader.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            homeHeader.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            homeHeader.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            // TABLE VIEW
            tableView.topAnchor.constraint(equalTo: homeHeader.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

// MARK: - TableView Data Source
extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        cell.textLabel?.text = tiles[indexPath.row]
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tiles.count
    }
}

// MARK: - TableView Delegate
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}
