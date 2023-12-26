//
//  Games.swift
//  Games
//
//  Created by Ferdi DEMİRCİ on 22.12.2023.
//

import Foundation

import Foundation

struct GameResponse: Codable {
  let count: Int
  let results: [Game]
}

struct Game: Codable {
  let id: Int
  let name: String
  let background_image: String
  let metacritic: Int
  let genres: [Genre]?
}

struct Genre: Codable {
  let name: String
}
