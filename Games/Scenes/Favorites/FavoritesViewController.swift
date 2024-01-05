//
//  FavoriteViewController.swift
//  Games
//
//  Created by Ferdi DEMİRCİ on 28.12.2023.
//

import UIKit
import SnapKit
import Carbon

class FavoritesViewController: UIViewController {
  private var viewModel = FavoritesViewModel.shared
  private let searchContainerView = UIView()
  private let searchBar = UISearchBar()
  private lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.backgroundColor = .clear
    tableView.separatorStyle = .none
    return tableView
  }()
  private lazy var renderer = Renderer(
    adapter: CustomTableViewAdapter(),
    updater: UITableViewUpdater()
  )
  override func viewWillAppear(_ animated: Bool) {
    navigationController?.navigationBar.prefersLargeTitles = true
    bindState()
    viewModel.fetchFavoriteGames()
    configureView()
  }
  func bindState() {
    viewModel.stateChangeHandler = { [weak self] state in
      guard let self = self else { return }
      switch state {
      case .render(let sections):
        self.render(sections)
      case .addTopView:
        self.configureTopView()
      case .removeTopView:
        self.hiddenTopView()
      case .addLoadingIndicator:
        self.viewModel.loadActivityIndicatorUI()
      case .tapGestureHandler(let gameId):
        self.tapGestureHandler(gameId)
      case .removeFavoriteGame:
        self.viewModel.fetchFavoriteGames()
//        tableView.reloadData()
      }
    }
  }
  func render(_ sections: [Section]) {
    renderer.render(sections)
  }
  func tapGestureHandler(_ gameId: Int) {
    let gameDetailsViewController = GameDetailsViewController()
    gameDetailsViewController.gameId = gameId
    navigationController?.pushViewController(gameDetailsViewController, animated: true)
  }
  func configureView() {
    view.backgroundColor = UIColor(red: 0.953, green: 0.953, blue: 0.953, alpha: 1)
    view.addSubviews(tableView)
    tableView.contentInset = UIEdgeInsets(top: -21, left: 0, bottom: 0, right: 0)
    renderer.target = tableView
    configureNavigation()
    configureConstraints()
  }
  func configureNavigation() {
    navigationItem.title = "Favorites"
    navigationController?.navigationBar.prefersLargeTitles = true
    let navBarAppearance = UINavigationBarAppearance()
    navBarAppearance.configureWithOpaqueBackground()
    navBarAppearance.backgroundColor = .white
    navigationController?.navigationBar.isTranslucent = true
    navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
  }
  private func configureTopView() {
    searchBar.delegate = self
    searchBar.placeholder = "Search for the games"
    view.addSubview(searchContainerView)
    searchContainerView.addSubview(searchBar)
    searchContainerView.snp.makeConstraints { make in
      make.top.equalTo(view.safeAreaLayoutGuide)
      make.leading.trailing.equalToSuperview()
      make.height.equalTo(50)
    }
    searchBar.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }
  private func hiddenTopView() {
    searchContainerView.snp.updateConstraints { make in
      make.height.equalTo(0)
    }
  }
  func configureConstraints() {
    tableView.snp.makeConstraints { make in
      make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
      make.leading.trailing.bottom.equalToSuperview()
    }
  }
}

extension FavoritesViewController: UISearchBarDelegate {
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    viewModel.searchGames(query: searchText)
    tableView.reloadData()
  }
}
