//
//  GameDetailsViewModel.swift
//  Games
//
//  Created by Ferdi DEMİRCİ on 26.12.2023.
//

import Foundation
import Carbon

extension GameDetailsViewModel {
  func getGameDetails(_ gameId: Int) {
    NetworkManager.shared.routerRequest(request: Router.getGameDetails(gameId)) { (result: Result<GameDetails, Error>) in
      switch result {
      case .success(let response):
        self.gameDetails = response
        self.checkFavoriteStatus()
        self.loadUI()
      case .failure(let error):
        print(error.localizedDescription)
      }
    }
  }
}
