//
//  MainViewController.swift
//  ShopApp2
//
//  Created by Aleksandar Micevski on 21.1.22.
//

import UIKit


class AddViewController: UIViewController {}
class FavoritesViewController: UIViewController {}


class MainViewController: UITabBarController {
    
    var favoritesItem: UITabBarItem!
    var recentsItem: UITabBarItem!
    var contactsItem: UITabBarItem!
    var moreItem: UITabBarItem!
    var keyPadItem: UITabBarItem!
    var voiceMailItem: UITabBarItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupTabBar()
    }
    
    func setupTabBar() {
        self.view.backgroundColor = .systemGray6
        self.tabBar.backgroundColor = .white
        
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        homeVC.tabBarItem = UITabBarItem(title: "home", image: UIImage(systemName: "house.fill"), tag: 1)
        homeVC.navigationBar.isHidden = true
        
        let shopVC = UINavigationController(rootViewController: ShopsViewController())
        shopVC.tabBarItem = UITabBarItem(title: "shop", image: UIImage(systemName: "bag.fill"), tag: 1)
        shopVC.navigationBar.isHidden = true
        
        let addVC = UINavigationController(rootViewController: AddViewController())
        addVC.tabBarItem = UITabBarItem(title: "add", image: UIImage(systemName: "plus.circle"), tag: 1)
        addVC.navigationBar.isHidden = true
        
        let favoritesVC = UINavigationController(rootViewController: FavoritesViewController())
        favoritesVC.tabBarItem = UITabBarItem(title: "favorites", image: UIImage(systemName: "heart.fill"), tag: 1)
        favoritesVC.navigationBar.isHidden = true
        
        let profileVC = UINavigationController(rootViewController: ProfileViewController())
        profileVC.tabBarItem = UITabBarItem(title: "profile", image: UIImage(systemName: "person.crop.circle"), tag: 1)
        profileVC.navigationBar.isHidden = true
        
        self.viewControllers = [homeVC, shopVC, addVC, favoritesVC, profileVC]
    }
}
