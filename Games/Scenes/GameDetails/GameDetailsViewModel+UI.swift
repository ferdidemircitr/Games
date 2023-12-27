//
//  GameDetailsViewModel.swift
//  Games
//
//  Created by Ferdi DEMİRCİ on 26.12.2023.
//

import Foundation
import Carbon

extension GameDetailsViewModel {
  func loadUI() {
    var sections: [Section] = []
    sections.append(makeGameDetailsSection())
    stateChangeHandler?(.render(sections))
  }

  func makeGameDetailsSection() -> Section {
    var nodes: [CellNode] = []
    nodes.append(makeGameDetailsNode())
    return Section(id: "GameDetailsSection", cells: nodes)
  }
  
  func makeGameDetailsNode() -> CellNode {
    let component = DetailsView()
    let node = CellNode(id: "GameDetailsNode", component)
    return node
  }
}
