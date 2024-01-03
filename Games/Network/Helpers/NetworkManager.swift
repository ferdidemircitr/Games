//
//  NetworkManager.swift
//  Games
//
//  Created by Ferdi DEMİRCİ on 22.12.2023.
//

import Foundation
import Alamofire

class NetworkManager {
  static let shared = NetworkManager()
  func routerRequest<T: Decodable>(request: URLRequestConvertible, callback: @escaping (Result<T, Error>) -> Void) {
    AF.request(request)
      .validate()
      .responseDecodable(of: T.self) { response in
        switch response.result {
        case .success(let value):
          callback(.success(value))
        case .failure(let error):
          callback(.failure(error))
        }
      }
  }
}
