//
//  Router.swift
//  Games
//
//  Created by Ferdi DEMİRCİ on 22.12.2023.
//

import Foundation
import Alamofire

public enum Router: URLRequestConvertible {
  
  case getGames
  
  var baseURL: URL {
    return URL(string: "https://api.rawg.io/api")!
  }
  
  private var method: HTTPMethod {
    switch self {
    case .getGames:
      return .get
    }
  }
  
  var path: String {
    switch self {
    case .getGames:
      return "/games"
    }
  }
  
  private var parameters: Parameters {
    switch self {
    case .getGames:
      return ["key": "3be8af6ebf124ffe81d90f514e59856c"]
    }
  }

  private var headers: HTTPHeaders {
    switch self {
    case .getGames:
      return [:]
    }
  }
  
  public func asURLRequest() throws -> URLRequest {
    let url = try baseURL.asURL()
    var urlRequest = URLRequest(url: url.appendingPathComponent(path))
    urlRequest.httpMethod = method.rawValue
    urlRequest.headers = headers
    
    let encoding: ParameterEncoding = {
      switch method {
      case .get:
        return URLEncoding.default
      default:
        return JSONEncoding.default
      }
    }()
    return try encoding.encode(urlRequest, with: parameters)
  }
}
