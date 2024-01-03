//
//  FavoritesViewModel.swift
//  Games
//
//  Created by Ferdi DEMİRCİ on 28.12.2023.
//

import Foundation
import Carbon

public extension FavoritesViewModel {
  func loadUI() {
    stateChangeHandler?(.addTopView)
    var sections: [Section] = []
    sections.append(makeFavoriListSection())
    stateChangeHandler?(.render(sections))
  }
  func loadActivityIndicatorUI() {
    var sections: [Section] = []
    sections.append(makeActivityIndicatorSection())
    stateChangeHandler?(.render(sections))
  }
  private func makeFavoriListSection() -> Section {
    var nodes: [CellNode] = []
    if isSearching {
      nodes.append(contentsOf: makeNodesForSearchResults())
    } else {
      nodes.append(contentsOf: makeNodesForAllGames())
    }
    return Section(id: "FavoriListSection", cells: nodes)
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
        makeGameItemNode(item: game),
        SpacingComponent(20).toCellNode()
      ]
    }
  }
  private func makeNodesForAllGames() -> [CellNode] {
    guard let favoriteGames = favoriteGames else {
      return [makeEmptyStateViewNode(message: Const.noServiceResult)]
    }
    if favoriteGames.isEmpty {
      return [makeEmptyStateViewNode(message: Const.noServiceResult)]
    }
    return favoriteGames.flatMap { game in
      [
        makeGameItemNode(item: game),
        SpacingComponent(20).toCellNode()
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
