//
//  ViewController.swift
//  Starbucks
//
//  Created by Alejandro Cervantes on 2024-04-24.
//

import UIKit

class HomeViewController: StarbucksViewController {
    
    let topSpacerView = UIView()
    let homeHeader = HomeHeaderView()
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    let scanButton = UIButton()
    
    var homeHeaderTopConstraint: NSLayoutConstraint?
    
    struct ScanButtonSpacing {
        static let height: CGFloat = 60
        static let width: CGFloat = 170
    }
    
    static let title_1 = "Breakfast made meatless"
    static let subtitle_1 = "Try the Beyond Meat, Cheddar & Egg Breakfast Sandwich. Vegetarian and protein-packed."
    static let image_1 = "meatless"
    
    static let title_2 = "Uplift our communities"
    static let subtitle_2 = "Thanks to our partners nominations, The Starbucks Foundation is donating $145K to more than 50 local charities."
    static let image_2 = "communities"
    
    static let title_3 = "Spend at least $15 for 50 Bonus Stars"
    static let subtitle_3 = "Collect 50 Bonus Stars when you spend at least $15 pre-tax."
    static let image_3 = "bonus"
    
    let tiles = [
           RewardsTileViewController(),
           TileViewController( title: title_1, subtitle: subtitle_1, imageName: image_1),
           TileViewController( title: title_2, subtitle: subtitle_2, imageName: image_2),
           TileViewController( title: title_3, subtitle: subtitle_3, imageName: image_3)]
    

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
        
        view.backgroundColor = .backgroundWhite
        topSpacerView.backgroundColor = .white
        
        topSpacerView.translatesAutoresizingMaskIntoConstraints = false
        homeHeader.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints  = false
        
        stackView.axis = .vertical
        stackView.spacing = 8
        
        scanButton.translatesAutoresizingMaskIntoConstraints = false
        scanButton.setTitle("Scan in store", for: .normal)
        scanButton.titleLabel?.minimumScaleFactor = 0.5
        scanButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title3)
        scanButton.titleLabel?.adjustsFontSizeToFitWidth = true
        scanButton.backgroundColor = .lightGreen
        scanButton.setTitleColor(.white, for: .normal)
        scanButton.layer.cornerRadius = ScanButtonSpacing.height/2
        
        homeHeader.delegate = self
    }
    
    func layout() {
        view.addSubview(topSpacerView)
        view.addSubview(homeHeader)
        view.addSubview(scrollView)
        view.addSubview(scanButton)
        
        scrollView.addSubview(stackView)
        
        for tile in tiles {
            addChild(tile)
            stackView.addArrangedSubview(tile.view)
            tile.didMove(toParent: self)
        }
        
        homeHeaderTopConstraint = homeHeader.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        
        NSLayoutConstraint.activate([
            topSpacerView.topAnchor.constraint(equalTo: view.topAnchor),
            topSpacerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topSpacerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topSpacerView.heightAnchor.constraint(equalToConstant: 100),
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
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            scanButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            scanButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -16),
            scanButton.heightAnchor.constraint(equalToConstant: ScanButtonSpacing.height),
            scanButton.widthAnchor.constraint(equalToConstant: ScanButtonSpacing.width)
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

// MARK: - HomeHeaderViewDelegate

extension HomeViewController: HomeHeaderViewDelegate {
    func didTapHistoryButton(_ sender: HomeHeaderView) {
        let navController = UINavigationController(rootViewController: HistoryViewController())
        present(navController, animated: true)
    }
}
