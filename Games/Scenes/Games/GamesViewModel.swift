//
//  GamesViewModel.swift
//  Games
//
//  Created by Ferdi DEMİRCİ on 20.12.2023.
//

import Foundation
import Carbon

public final class GamesViewModel {
  enum Const {
    static let minimumSearchValue = 3
  }
  
  var stateChangeHandler: Callback<GamesViewController.State>?
  var allGames: [Game]?
  var filteredGames: [Game]?
  var isSearching = false
  var isSearchQueryLengthLessThanMinimum = false
  
  func searchGames(query: String) {
    if let allGames = allGames,
       !query.isEmpty,
       query.count > Const.minimumSearchValue {
      filteredGames = allGames.filter {
        $0.name.lowercased().contains(query.lowercased())
      }
      isSearching = true
      isSearchQueryLengthLessThanMinimum = true
      loadUI()
    } else {
      if isSearchQueryLengthLessThanMinimum {
        isSearching = false
        isSearchQueryLengthLessThanMinimum = false
        loadUI()
      }
    }
  }
}
