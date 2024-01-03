//
//  GamesViewModel.swift
//  Games
//
//  Created by Ferdi DEMİRCİ on 20.12.2023.
//

import Foundation
import Carbon
import CoreData

public final class GamesViewModel {
  enum Const {
    static let minimumSearchValue = 3
    static let noSearchResult = "No game has been searched."
    static let noServiceResult = "No service results."
  }
  
  var stateChangeHandler: Callback<GamesViewController.State>?
  var allGames: [Game]?
  var filteredGames: [Game]?
  var isSearching = false
  var isSearchQueryLengthLessThanMinimum = false
  var coreDataManager = CoreDataManager.shared
  
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

  func addVisited(id: Int) {
    coreDataManager.addVisitedGame(add: id)
//    stateChangeHandler?(.favoritedOrNot)
  }
}
