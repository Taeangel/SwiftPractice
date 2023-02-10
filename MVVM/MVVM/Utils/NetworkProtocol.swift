//
//  NetworkProtocol.swift
//  MVVM
//
//  Created by song on 2023/02/02.
//

import Foundation

protocol NetworkProtocol {
  associatedtype Model
  func response(json: [String: Any]) -> Model
}

extension NetworkProtocol {
  func request(completion: @escaping (Result<Self.Model, Error>) -> ()) {
    
    let workItem: DispatchWorkItem = DispatchWorkItem {
      let responseData: [String: Any] = ["MVVM": ["야", "이", "야", "이", "야", "이", "야", "이"]]
      completion(.success(self.response(json: responseData)))
//      completion(.failure(NSError(domain: "테스트에러", code: 999)))
    }
    DispatchQueue.global().asyncAfter(deadline: .now() + 2, execute: workItem)
    
  }
}
