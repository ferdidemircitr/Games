//
//  GameDetailsViewModel.swift
//  Games
//
//  Created by Ferdi DEMİRCİ on 26.12.2023.
//

import Foundation
import CoreData


public final class GameDetailsViewModel {
  var stateChangeHandler: Callback<GameDetailsViewController.State>?
  var gameId: Int?
  var gameDetails: GameDetails?
  let coreDataManager = CoreDataManager()
  var isFavorite = false
  
  func checkFavoriteStatus() {
    guard let gameId = gameDetails?.id else { return }
    
    isFavorite = coreDataManager.isFavorite(id: gameId)
    stateChangeHandler?(.favoritedOrNot)
  }
  
  func addFavoriteGame() {
    guard let gameDetails = gameDetails,
          let genres = gameDetails.genres else { return }
    
    let genreNames = genres.map { $0.name }
    let combinedGenreNames = genreNames.joined(separator: ", ")
    
    let model = FavoriteGame(
      id: gameDetails.id,
      name: gameDetails.name,
      descriptionRaw: gameDetails.descriptionRaw,
      backgroundImage: gameDetails.backgroundImage,
      website: gameDetails.website,
      redditUrl: gameDetails.redditURL,
      metacritic: gameDetails.metacritic,
      genres: combinedGenreNames
    )
    
    coreDataManager.addData(add: model)
    isFavorite = true
    stateChangeHandler?(.favoritedOrNot)
  }
  
  func removeFavoriteGame() {
    guard let gameDetails = gameDetails else { return }
    
    if let favoriteGame = coreDataManager.fetchFavoriteGame(by: gameDetails.id) {
      coreDataManager.deleteData(delete: favoriteGame)
      isFavorite = false
      stateChangeHandler?(.favoritedOrNot)
    }
  }
}
