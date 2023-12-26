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
    if isSearching {
      if filteredGames?.count == 0 {
        // TODO: - Boş olma durumu için bir sonraki branch'te componentview yapılacak
      }
      filteredGames?.forEach({ game in
        nodes.append(makeGameItemNode(item: game))
        nodes.append(SpacingComponent(20).toCellNode())
      })
    } else {
      allGames?.forEach({ game in
        nodes.append(makeGameItemNode(item: game))
        nodes.append(SpacingComponent(20).toCellNode())
      })
    }
    return Section(id: "GameListSection", cells: nodes)
  }
  
  private func makeGameItemNode(item: Game) -> CellNode {
    let component = GameItemView()
    component.item = item
    let node = CellNode(id: item.id, component)
    return node
  }
  
  private func makeNotSearchNode(item: Game) -> CellNode {
    let component = GameItemView()
    component.item = item
    let node = CellNode(id: item.id, component)
    return node
  }
}
