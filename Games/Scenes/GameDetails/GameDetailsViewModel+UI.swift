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
    guard let gameDetails = gameDetails else { return }
    var sections: [Section] = []
    sections.append(makeGameDetailsSection(item: gameDetails))
    stateChangeHandler?(.render(sections))
  }

  func makeGameDetailsSection(item: GameDetails) -> Section {
    var nodes: [CellNode] = []
    nodes.append(makeGameDetailsNode(item))
    nodes.append(makeVisitRedditButtonNode(item))
    nodes.append(makeVisitWebsiteButtonNode(item))
    return Section(id: "GameDetailsSection", cells: nodes)
  }
  
  func makeGameDetailsNode(_ item: GameDetails) -> CellNode {
    let component = DetailsView()
    component.item = item
    let node = CellNode(id: "GameDetailsNode", component)
    return node
  }
  
  func makeVisitRedditButtonNode(_ item: GameDetails) -> CellNode {
    let component = CustomButtonView(title: "Visit reddit", url: item.redditURL)
    let node = CellNode(id: "VisitRedditButtonNode", component)
    return node
  }
  
  func makeVisitWebsiteButtonNode(_ item: GameDetails) -> CellNode {
    let component = CustomButtonView(title: "Visit website", url: item.website)
    let node = CellNode(id: "VisitWebsiteButtonNode", component)
    return node
  }
}
