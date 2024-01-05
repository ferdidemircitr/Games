//
//  FavoritesViewModel.swift
//  Games
//
//  Created by Ferdi DEMİRCİ on 28.12.2023.
//

import Foundation
import Carbon

extension FavoritesViewController {
  enum State {
    case render(_ section: [Section])
    case addTopView
    case removeTopView
    case addLoadingIndicator
    case tapGestureHandler(Int)
    case removeFavoriteGame
  }
}
