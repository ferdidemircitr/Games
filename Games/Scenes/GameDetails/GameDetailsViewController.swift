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
  var gameID: Int?
  
  private lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.backgroundColor = .clear
    tableView.separatorStyle = .none
    return tableView
  }()
  
  private lazy var renderer = Renderer(
    adapter: UITableViewAdapter(),
    updater: UITableViewUpdater()
  )
  
  override func viewDidLoad() {
    super.viewDidLoad()
    bindState()
    viewModel.loadUI()
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
      make.top.equalTo(view.safeAreaLayoutGuide).offset(25)
      make.leading.trailing.bottom.equalToSuperview()
    }
  }
}
