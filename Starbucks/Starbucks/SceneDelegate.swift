//
//  SceneDelegate.swift
//  Starbucks
//
//  Created by Alejandro Cervantes on 2024-04-24.
//

import UIKit

class StarbucksViewController: UIViewController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit() {
        
    }
    
    func setTabBarItem(imageName: String, title: String) {
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: imageName, withConfiguration: configuration)
        tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
    }
}

class ScanViewController: StarbucksViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemIndigo
        title = "Scan"
    }
    
    override func commonInit() {
        setTabBarItem(imageName: "qrcode", title: "Scan")
    }
}

class OrderViewController: StarbucksViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemOrange
        title = "Order"
    }
    
    override func commonInit() {
        setTabBarItem(imageName: "arrow.up.bin.fill", title: "Order")
    }
}

class GiftViewController: StarbucksViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemGreen
        title = "Gift"
    }
    
    override func commonInit() {
        setTabBarItem(imageName: "gift.fill", title: "Gift")
    }
}

class StoreViewController: StarbucksViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemTeal
        title = "Stores"
    }
    
    override func commonInit() {
        setTabBarItem(imageName: "location.fill", title: "Stores")
    }
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        let homeVC = HomeViewController()
        let scanVC = ScanViewController()
        let orderVC = OrderViewController()
        let giftVC = GiftViewController()
        let storeVC = StoreViewController()
        
        let scanNC = UINavigationController(rootViewController: scanVC)
        let orderNC = UINavigationController(rootViewController: orderVC)
        let giftNC = UINavigationController(rootViewController: giftVC)
        let storeNC = UINavigationController(rootViewController: storeVC)
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [homeVC, scanNC, orderNC, giftNC, storeNC]
        
        window?.rootViewController = tabBarController
    }

    func makeNavigationController(rootViewController: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.navigationBar.prefersLargeTitles = true
        
        let attrs: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.label,
            .font: UIFont.preferredFont(forTextStyle: .title1).bold()
        ]
        
        navigationController.navigationBar.largeTitleTextAttributes = attrs
        
        return navigationController
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

