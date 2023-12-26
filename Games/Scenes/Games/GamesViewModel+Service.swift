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
      stateChangeHandler?(.addLoadingIndicator)
      NetworkManager.shared.routerRequest(request: Router.getGames) { (result: Result<GameResponse, Error>) in
        switch result {
        case .success(let response):
          self.allGames = response.results
          self.loadUI()
        case .failure(let error):
          print(error.localizedDescription)
        }
      }
    }
  }
