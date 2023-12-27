//
//  Games+State.swift
//  Games
//
//  Created by Ferdi DEMİRCİ on 21.12.2023.
//

import Foundation
import Carbon

extension GamesViewController {
  enum State {
    case render(_ section: [Section])
    case addTopView
    case removeTopView
    case addLoadingIndicator
    case tapGestureHandler(Int)
  }
}
