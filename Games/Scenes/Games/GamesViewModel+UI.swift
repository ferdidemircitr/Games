//
//  GamesViewModel.swift
//  Games
//
//  Created by Ferdi DEMİRCİ on 20.12.2023.
//

import Foundation
import Carbon

public extension GamesViewModel {
  func loadUI() {
    stateChangeHandler?(.addTopView)
    var sections: [Section] = []
    sections.append(makeGameListSection())
    stateChangeHandler?(.render(sections))
  }
  
  private func makeGameListSection() -> Section {
    var nodes: [CellNode] = []
    nodes.append(makeGameItemNode())
    nodes.append(SpacingComponent(20).toCellNode())
    nodes.append(makeGameItemNode())
    return Section(id: "GameListSection", cells: nodes)
  }
  
  private func makeGameItemNode() -> CellNode {
    let model = GameItemView()
    let node = CellNode(id: "GameItemView", model)
    return node
  }
}
