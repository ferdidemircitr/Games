//
//  GameDetailsViewController.swift
//  Games
//
//  Created by Ferdi DEMİRCİ on 26.12.2023.
//

import UIKit
import SnapKit
import Carbon

class GameDetailsViewController: UIViewController {
  
  private var viewModel = GameDetailsViewModel()
  var gameId: Int?
  
  private lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.backgroundColor = .clear
    return tableView
  }()
  
  private lazy var renderer = Renderer(
    adapter: UITableViewAdapter(),
    updater: UITableViewUpdater()
  )
  
  override func viewDidLoad() {
    super.viewDidLoad()
    bindState()
    viewModel.getGameDetails(gameId!)
    configureView()
  }
  
  func bindState() {
    viewModel.stateChangeHandler = { [weak self] state in
      guard let self = self else { return }
      switch state {
      case .render(let sections):
        render(sections)
      }
    }
  }
  
  func render(_ sections: [Section]) {
    renderer.render(sections)
  }
  
  func configureView() {
    view.backgroundColor = .white
    view.addSubviews(tableView)
    tableView.contentInset = UIEdgeInsets(top: -21, left: 0, bottom: 0, right: 0)
    renderer.target = tableView
    configureNavigation()
    configureConstraints()
  }
  
  func configureNavigation() {
    navigationController?.navigationBar.prefersLargeTitles = false
    let favoriteButton = UIBarButtonItem(title: "Favorite", style: .plain, target: self, action: #selector(favoriteButtonTapped))
    navigationItem.rightBarButtonItem = favoriteButton
  }
  
  @objc private func favoriteButtonTapped() {
  }
  
  func configureConstraints() {
    tableView.snp.makeConstraints { make in
      make.top.equalTo(view.safeAreaLayoutGuide)
      make.leading.trailing.bottom.equalToSuperview()
    }
  }
}
