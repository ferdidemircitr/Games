//
//  IdentifiableComponent.swift
//  Games
//
//  Created by Ferdi DEMİRCİ on 21.12.2023.
//

import Foundation
import Carbon

public extension IdentifiableComponent {
  var id: String { return reuseIdentifier }

  func toCellNode() -> CellNode {
    return CellNode(self)
  }

  func toViewNode() -> ViewNode {
    return ViewNode(self)
  }
}
