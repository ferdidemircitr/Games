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
    
    view.backgroundColor = .systemBackground
    
    let gamesViewController = GamesViewController()
    gamesViewController.tabBarItem = UITabBarItem(title: "Games", image: UIImage(systemName: "gamecontroller.fill"), tag: 0)
    
    let favoriteViewController = FavoriteViewController()
    favoriteViewController.tabBarItem = UITabBarItem(title: "Favorite", image: UIImage(systemName: "star.fill"), tag: 1)
    
    let tabBarList = [gamesViewController, favoriteViewController]
    viewControllers = tabBarList.map({ UINavigationController(rootViewController: $0) })
  }
}
