//
//  FavoritesViewModel.swift
//  Games
//
//  Created by Ferdi DEMİRCİ on 28.12.2023.
//

import Foundation
import Carbon
import CoreData

public final class FavoritesViewModel {
  enum Const {
    static let minimumSearchValue = 3
    static let noSearchResult = "No game has been searched."
    static let noServiceResult = "There is no favourites found."
  }
  var stateChangeHandler: Callback<FavoritesViewController.State>?
  var favoriteGames: [Game]?
  var filteredGames: [Game]?
  var isSearching = false
  var isSearchQueryLengthLessThanMinimum = false
  let coreDataManager = CoreDataManager.shared
  func searchGames(query: String) {
    if let allGames = favoriteGames,
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
  func fetchFavoriteGames() {
      if let favoriteGameObjects = coreDataManager.fetchData() {
          favoriteGames = favoriteGameObjects.compactMap { createFavoriteGameModel(from: $0) }
      }
    loadUI()
  }
  private func createFavoriteGameModel(from object: NSManagedObject) -> Game? {
      guard
          let id = object.value(forKey: "id") as? Int,
          let name = object.value(forKey: "name") as? String,
          let backgroundImage = object.value(forKey: "backgroundImage") as? String,
          let metacritic = object.value(forKey: "metacritic") as? Int,
          let genres = object.value(forKey: "genres") as? String
      else {
          return nil
      }
    return Game(id: id, name: name, backgroundImage: backgroundImage, metacritic: metacritic, genres: parseGenresString(genres))
  }
  func parseGenresString(_ genresString: String) -> [Genre] {
      let genreNames = genresString.components(separatedBy: ", ")
      let genres = genreNames.map { Genre(name: $0) }
      return genres
  }
}
