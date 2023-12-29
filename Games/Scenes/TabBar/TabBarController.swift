//
//  TabBarController.swift
//  Games
//
//  Created by Ferdi DEMİRCİ on 28.12.2023.
//

import UIKit

class TabBarController: UITabBarController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupViews()
  }
  private func setupViews(){
    tabBar.backgroundColor = .white

    let gamesViewController = GamesViewController()
    gamesViewController.tabBarItem = UITabBarItem(title: "Games", image: UIImage(systemName: "gamecontroller.fill"), tag: 0)
    
    let favoritesViewController = FavoritesViewController()
    favoritesViewController.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "star.fill"), tag: 1)
    
    let tabBarList = [gamesViewController, favoritesViewController]
    viewControllers = tabBarList.map({ UINavigationController(rootViewController: $0) })
  }
}
