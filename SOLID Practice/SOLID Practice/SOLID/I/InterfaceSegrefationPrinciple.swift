//
//  CommentViewModel.swift
//  SOLID Practice
//
//  Created by song on 2022/10/20.
//

import Foundation

// MARK: - after
//class CommentViewModel: ObservableObject {
//
//  let serviceHandler: CommentViewServiceDelegate
//  let dataBaseCommentHandler: CommentsDelegate
//
//  init(
//    commentHandler: CommentViewServiceDelegate = CommnetViewService(),
//    dataBaseCommentHandler: CommentsDelegate = DatabaseHandler()
//  ) {
//    self.serviceHandler = commentHandler
//    self.dataBaseCommentHandler = dataBaseCommentHandler
//  }
//
//  @Published var comments = [CommentModel]()
//
//  func fetchComments() {
//    if isConnected() {
//      DispatchQueue.main.async {
//        self.serviceHandler.getComments { result in
//          switch result {
//          case .success(let comment):
//            self.comments = comment
//          case .failure(let error):
//            print(error)
//          }
//        }
//      }
//    } else {
//      DispatchQueue.main.async {
//        self.dataBaseCommentHandler.getComments { result in
//          switch result {
//          case .success(let comment):
//            self.comments = comment
//          case .failure(let error):
//            print(error)
//          }
//        }
//      }
//    }
//  }
//
//  private func isConnected() -> Bool {
//    return true
//  }
//
//  func fetchUsers() {
//    DispatchQueue.main.async {
//      self.serviceHandler.getUsers { result in
//        switch result {
//        case .success(let users):
//          print(users)
//        case .failure(let error):
//          print(error)
//        }
//      }
//    }
//  }
//}
//
//
//protocol CommentsDelegate {
//  func getComments(completion: @escaping(Result<[CommentModel], DemoError>) -> Void)
//}
//
//protocol UserDelegate {
//  func getUsers(completion: @escaping(Result<UserModel, DemoError>) -> Void)
//}
//
//protocol CommentViewServiceDelegate: CommentsDelegate, UserDelegate {}
//
//class CommnetViewService: CommentViewServiceDelegate {
//
//  func getComments(completion: @escaping(Result<[CommentModel], DemoError>) -> Void) {
//    guard let url = URL(string: "유알엘쓰는칸입니다") else {
//      return completion(.failure(.BadURL))
//    }
//
//    NetworkManager().fetchRequest(type: [CommentModel].self, url: url, completion: completion)
//  }
//
//  func getUsers(completion: @escaping(Result<UserModel, DemoError>) -> Void) {
//    guard let url = URL(string: "유알엘쓰는칸입니다") else {
//      return completion(.failure(.BadURL))
//    }
//
//    NetworkManager().fetchRequest(type: UserModel.self, url: url, completion: completion)
//  }
//
//  private func isConnected() -> Bool {
//    return true
//  }
//
//}
//
//class DatabaseHandler: CommentsDelegate {
//  func getComments(completion: @escaping (Result<[CommentModel], DemoError>) -> Void) {
//    guard let url = Bundle.main.url(forResource: "Comments", withExtension: "json"),
//          let data = try? Data(contentsOf: url),
//          let model = try? JSONDecoder().decode([CommentModel].self, from: data) else {
//      return completion(.failure(.DecodingError))
//    }
//    completion(.success(model))
//  }
//}

//class CommentViewModel: ObservableObject {
//
//  let serviceHandler: CommentViewServiceDelegate
//  let dataBaseHandler: CommentViewServiceDelegate
//
//  init(
//    serviceHandler: CommentViewServiceDelegate = CommnetViewService(),
//    dataBaseHandler: CommentViewServiceDelegate = DatabaseHandler()
//  ) {
//    self.serviceHandler = serviceHandler
//    self.dataBaseHandler = dataBaseHandler
//  }
//
//  @Published var comments = [CommentModel]()
//
//  func fetchComments() {
//    if isConnected() {
//      DispatchQueue.main.async {
//        CommnetViewService().getComments { result in
//          switch result {
//          case .success(let comment):
//            self.comments = comment
//          case .failure(let error):
//            print(error)
//          }
//        }
//      }
//    } else {
//      DispatchQueue.main.async {
//        CommnetViewService().getComments { result in
//          switch result {
//          case .success(let comment):
//            self.comments = comment
//          case .failure(let error):
//            print(error)
//          }
//        }
//      }
//    }
//  }
//
//  private func isConnected() -> Bool {
//    return true
//  }
//
//  func fetchUsers() {
//    DispatchQueue.main.async {
//      self.serviceHandler.getUsers { result in
//        switch result {
//        case .success(let users):
//          print(users)
//        case .failure(let error):
//          print(error)
//        }
//      }
//    }
//  }
//}
//
//protocol CommentViewServiceDelegate {
//  func getComments(completion: @escaping(Result<[CommentModel], DemoError>) -> Void)
//   func getUsers(completion: @escaping(Result<UserModel, DemoError>) -> Void)
//}
//
//class CommetViewService: CommentViewServiceDelegate {
//  func getComments(completion: @escaping(Result<[CommentModel], DemoError>) -> Void) {
//    guard let url = URL(string: "유알엘쓰는칸입니다") else {
//      return completion(.failure(.BadURL))
//    }
//
//    NetworkManager().fetchRequest(type: [CommentModel].self, url: url, completion: completion)
//  }
//
//  func getUsers(completion: @escaping(Result<UserModel, DemoError>) -> Void) {
//    guard let url = URL(string: "유알엘쓰는칸입니다") else {
//      return completion(.failure(.BadURL))
//    }
//
//    NetworkManager().fetchRequest(type: UserModel.self, url: url, completion: completion)
//  }
//}
//
//class DatabaseHandler: CommentsDelegate {
//  func getComments(completion: @escaping (Result<[CommentModel], DemoError>) -> Void) {
//    guard let url = Bundle.main.url(forResource: "Comments", withExtension: "json"),
//          let data = try? Data(contentsOf: url),
//          let model = try? JSONDecoder().decode([CommentModel].self, from: data) else {
//      return completion(.failure(.DecodingError))
//    }
//    completion(.success(model))
//  }
//
//  func getUsers(completion: @escaping (Result<UserModel, DemoError>) -> Void) {
//
//  }
//
//}
