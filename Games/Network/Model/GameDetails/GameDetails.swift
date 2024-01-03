//
//  GameDetails.swift
//  Games
//
//  Created by Ferdi DEMİRCİ on 27.12.2023.
//

import Foundation

struct GameDetails: Codable {
  let id: Int
  let name: String
  let metacritic: Int
  let backgroundImage: String
  let website: String
  let redditURL: String
  let genres: [Genre]?
  let descriptionRaw: String
  enum CodingKeys: String, CodingKey {
    case id
    case name
    case metacritic
    case backgroundImage = "background_image"
    case website
    case redditURL = "reddit_url"
    case genres
    case descriptionRaw = "description_raw"
  }
}
