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
  func loadActivityIndicatorUI() {
    var sections: [Section] = []
    sections.append(makeActivityIndicatorSection())
    stateChangeHandler?(.render(sections))
  }
  private func makeGameListSection() -> Section {
    var nodes: [CellNode] = []
    if isSearching {
      nodes.append(contentsOf: makeNodesForSearchResults())
    } else {
      nodes.append(contentsOf: makeNodesForAllGames())
    }
    return Section(id: "GameListSection", cells: nodes)
  }
  private func makeActivityIndicatorSection() -> Section {
    var nodes: [CellNode] = []
    nodes.append(makeActivityIndicatorViewNode())
    return Section(id: "ActivityIndicatorSection", cells: nodes)
  }
  private func makeNodesForSearchResults() -> [CellNode] {
    guard let filteredGames = filteredGames else {
      return [makeEmptyStateViewNode(message: Const.noServiceResult)]
    }
    if filteredGames.isEmpty {
      return [makeEmptyStateViewNode(message: Const.noSearchResult)]
    }
    return filteredGames.flatMap { game in
      [
        makeGameItemNode(item: game)
      ]
    }
  }
  private func makeNodesForAllGames() -> [CellNode] {
    guard let allGames = allGames else {
      return [makeEmptyStateViewNode(message: Const.noServiceResult)]
    }
    if allGames.isEmpty {
      return [makeEmptyStateViewNode(message: Const.noServiceResult)]
    }
    return allGames.flatMap { game in
      [
        makeGameItemNode(item: game)
      ]
    }
  }
  private func makeGameItemNode(item: Game) -> CellNode {
    var component = GameComponent(item: item)
    component.tapGestureHandler = { state in
      self.stateChangeHandler?(.tapGestureHandler(state))
    }
    let node = CellNode(id: "GameItemCellNode", component)
    return node
  }
  private func makeEmptyStateViewNode(message: String) -> CellNode {
    let component = EmptyStateView()
    component.message = message
    let node = CellNode(id: "EmptyStateViewNode", component)
    return node
  }
  private func makeActivityIndicatorViewNode() -> CellNode {
    let component = ActivityIndicatorView()
    let node = CellNode(id: "ActivityIndicatorViewNode", component)
    return node
  }
}
