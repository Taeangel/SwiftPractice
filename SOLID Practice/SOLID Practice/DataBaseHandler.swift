//
//  DataBaseHandler.swift
//  SOLID Practice
//
//  Created by song on 2022/10/20.
//

import Foundation

class DatabaseHandler: CommentViewServiceDelegate  {
  func getComments(completion: @escaping (Result<[CommentModel], DemoError>) -> Void) {
    guard let url = Bundle.main.url(forResource: "Comments", withExtension: "json"),
          let data = try? Data(contentsOf: url),
          let model = try? JSONDecoder().decode([CommentModel].self, from: data) else {
      return completion(.failure(.DecodingError))
    }
    completion(.success(model))
  }
  
  func getUsers(completion: @escaping (Result<UserModel, DemoError>) -> Void) {
    
  }
}
