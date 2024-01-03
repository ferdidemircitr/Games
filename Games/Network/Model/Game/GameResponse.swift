//
//  Games.swift
//  Games
//
//  Created by Ferdi DEMİRCİ on 22.12.2023.
//

import Foundation

struct GameResponse: Codable {
  let count: Int
  let results: [Game]
}

struct Game: Codable {
  let id: Int
  let name: String
  let backgroundImage: String
  let metacritic: Int
  let genres: [Genre]?
  enum CodingKeys: String, CodingKey {
    case id
    case name
    case backgroundImage = "background_image"
    case metacritic
    case genres
  }
}

struct Genre: Codable {
  let name: String
}
