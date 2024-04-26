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
        homeHeader.backgroundColor = .systemMint
        
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
        
        homeHeaderTopConstraint = homeHeader.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        
        NSLayoutConstraint.activate([
            // HEADER VIEW
            homeHeaderTopConstraint!,
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
