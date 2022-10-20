//
//  CommentViewModel.swift
//  SOLID Practice
//
//  Created by song on 2022/10/20.
//

import Foundation

class CommentViewModel: ObservableObject {

  let serviceHandler: CommentViewServiceDelegate
  let dataBaseCommentHandler: CommentsDelegate

  init(
    commentHandler: CommentViewServiceDelegate = CommnetViewService(),
    dataBaseCommentHandler: CommentsDelegate = DatabaseHandler()
  ) {
    self.serviceHandler = commentHandler
    self.dataBaseCommentHandler = dataBaseCommentHandler
  }

  @Published var comments = [CommentModel]()

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
