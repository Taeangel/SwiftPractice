//
//  LiskovSubstitutionPrincipal.swift
//  SOLID Practice
//
//  Created by song on 2022/10/20.
//

import Foundation

class CommentViewModel: ObservableObject {
  @Published var comments = [CommentModel]()
  let serviceHandler: CommentViewServiceDelegate
  let dataBaseCommentHandler: CommentViewServiceDelegate

  init(
    commentHandler: CommentViewServiceDelegate = CommnetViewService(),
    dataBaseCommentHandler: CommentViewServiceDelegate = DatabaseHandler()
  ) {
    self.serviceHandler = commentHandler
    self.dataBaseCommentHandler = dataBaseCommentHandler
  }

  func fetchComments() {
    if isConnected() {
      DispatchQueue.main.async {
        self.serviceHandler.getComments { result in
          switch result {
          case .success(let comment):
            self.comments = comment
          case .failure(let error):
            print(error)
          }
        }
      }
    } else {
      DispatchQueue.main.async {
        self.dataBaseCommentHandler.getComments { result in
          switch result {
          case .success(let comment):
            self.comments = comment
          case .failure(let error):
            print(error)
          }
        }
      }
    }
  }

  private func isConnected() -> Bool {
    return true
  }

  func fetchUsers() {
    DispatchQueue.main.async {
      self.serviceHandler.getUsers { result in
        switch result {
        case .success(let users):
          print(users)
        case .failure(let error):
          print(error)
        }
      }
    }
  }
}

protocol CommentViewServiceDelegate {
  func getComments(completion: @escaping(Result<[CommentModel], DemoError>) -> Void)
  func getUsers(completion: @escaping(Result<UserModel, DemoError>) -> Void)
}

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
}
