//
//  GameDetailsViewController+State.swift
//  Games
//
//  Created by Ferdi DEMİRCİ on 26.12.2023.
//

import Foundation
import Carbon

extension GameDetailsViewController {
  enum State {
    case render(_ section: [Section])
  }
}
