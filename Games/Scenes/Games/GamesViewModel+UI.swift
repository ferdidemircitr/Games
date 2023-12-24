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
    gamesList?.forEach({ game in
      print(game.name)
      nodes.append(makeGameItemNode(item: game))
      nodes.append(SpacingComponent(20).toCellNode())
    })
    return Section(id: "GameListSection", cells: nodes)
  }
  
  private func makeGameItemNode(item: Game) -> CellNode {
    let component = GameItemView(item: item)
    let node = CellNode(id: item.id, component)
    return node
  }
}
