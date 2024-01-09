//
//  PagenationTableViewAdaptor.swift
//  Games
//
//  Created by Ferdi DEMİRCİ on 9.01.2024.
//

import Foundation
import Carbon

class PagenationTableViewAdaptor: UITableViewAdapter {
  let viewModel = GamesViewModel.shared
  override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    let lastRowIndex = tableView.numberOfRows(inSection: indexPath.section) - 2
    
    if indexPath.row == lastRowIndex {
      viewModel.currentPage += 1
      viewModel.isLoading = false
      viewModel.getGames()
    }
  }
}
