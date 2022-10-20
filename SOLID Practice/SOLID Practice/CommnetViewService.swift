//
//  CommnetViewService.swift
//  SOLID Practice
//
//  Created by song on 2022/10/20.
//

import Foundation
 
protocol CommentsDelegate {
  func getComments(completion: @escaping(Result<[CommentModel], DemoError>) -> Void)
}

protocol UserDelegate {
  func getUsers(completion: @escaping(Result<UserModel, DemoError>) -> Void)
}

protocol CommentViewServiceDelegate: CommentsDelegate, UserDelegate {}

class CommnetViewService: CommentViewServiceDelegate {

  func getComments(completion: @escaping(Result<[CommentModel], DemoError>) -> Void) {
    guard let url = URL(string: "유알엘쓰는칸입니다") else {
      return completion(.failure(.BadURL))
    }

    NetworkManager().fetchRequest(type: [CommentModel].self, url: url, completion: completion)
  }

  func getUsers(completion: @escaping(Result<UserModel, DemoError>) -> Void) {
    guard let url = URL(string: "유알엘쓰는칸입니다") else {
      return completion(.failure(.BadURL))
    }

    NetworkManager().fetchRequest(type: UserModel.self, url: url, completion: completion)
  }

  private func isConnected() -> Bool {
    return true
  }

}
