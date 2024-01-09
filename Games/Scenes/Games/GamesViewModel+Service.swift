//
//  GamesViewModel+Service.swift
//  Games
//
//  Created by Ferdi DEMİRCİ on 22.12.2023.
//

import Foundation
import Alamofire

extension GamesViewModel {
  func getGames() {
    if isLoading {
      return
    }
    stateChangeHandler?(.addLoadingIndicator)
    NetworkManager.shared.routerRequest(request: Router.getGamesPage(currentPage)) { [weak self] (result: Result<GameResponse, Error>) in
      guard let self = self else { return }
      switch result {
      case .success(let response):
        if self.allGames == nil {
          self.allGames = response.results
        } else {
          self.allGames?.append(contentsOf: response.results)
        }
        stateChangeHandler?(.removeLoadingIndicator)
      case .failure(let error):
        print(error.localizedDescription)
      }
    }
  }
}
