//
//  OpenClosePrincipal.swift
//  SOLID Practice
//
//  Created by song on 2022/10/20.
//

import Foundation


// MARK: - afetr
//class NetworkManager {
//
//  let apiHandler: APIHandler
//  let responseHandler: ResponseHandler
//
//  init(
//    apiHandler: APIHandler = APIHandler(),
//    responseHandler: ResponseHandler = ResponseHandler()
//  ) {
//    self.apiHandler = apiHandler
//    self.responseHandler = responseHandler
//  }
//
//  func fetchRequest<T: Codable>(type: T.Type, url: URL, completion: @escaping (Result<T, DemoError> ) -> Void) {
//
//    apiHandler.fetchData(url: url) { result in
//      switch result {
//      case .success(let data):
//        self.responseHandler.fetchModel(type: type, data: data) { decodedResult in
//          switch decodedResult {
//          case .success(let model):
//            completion(.success(model))
//          case .failure(let error):
//            completion(.failure(error))
//          }
//        }
//      case .failure(let error):
//        completion(.failure(error))
//      }
//    }
//  }
//}
//
//class APIHandler {
//  func fetchData(url: URL, completion: @escaping (Result<Data, DemoError> ) -> Void) {
//
//    URLSession.shared.dataTask(with: url) { data, respond, error in
//
//      guard let data = data, error == nil else {
//        return completion(.failure(.NoData))
//      }
//      completion(.success(data))
//    }.resume()
//  }
//}
//
//class ResponseHandler {
//  func fetchModel<T: Codable>(type: T.Type, data: Data, completion: @escaping (Result<T, DemoError> ) -> Void) {
//    let commentRespons = try? JSONDecoder().decode(type.self, from: data)
//    if let commentRespons = commentRespons {
//      return completion(.success(commentRespons))
//    } else {
//      return completion(.failure(.DecodingError))
//    }
//  }
//}

// MARK: -  before

//
//class NetworkManager {
//
//  let apiHandler: APIHandler
//  let responseHandler: ResponseHandler
//
//  init(
//    apiHandler: APIHandler = APIHandler(),
//    responseHandler: ResponseHandler = ResponseHandler()
//  ) {
//    self.apiHandler = apiHandler
//    self.responseHandler = responseHandler
//  }
//
//  func getComment(completion: @escaping (Result<[CommentModel], DemoError> ) -> Void) {
//    guard let url = URL(string: "유알엘쓰는칸입니다") else {
//      return completion(.failure(.BadURL))
//    }
//    apiHandler.getComment(url: url) { result in
//      switch result {
//      case .success(let data):
//        self.responseHandler.getComment(data: data) { decodedResult in
//          switch decodedResult {
//          case .success(let model):
//            completion(.success(model))
//          case .failure(let error):
//            completion(.failure(error))
//          }
//        }
//      case .failure(let error):
//        completion(.failure(error))
//      }
//    }
//  }
//
//  func fetchUsers(completion: @escaping (Result<UserModel, DemoError> ) -> Void) {
//    guard let url = URL(string: "유알엘쓰는칸입니다") else {
//      return completion(.failure(.BadURL))
//    }
//    apiHandler.getUser(url: url) { result in
//      switch result {
//      case .success(let data):
//        self.responseHandler.getUser(data: data) { decodedResult in
//          switch decodedResult {
//          case .success(let model):
//            completion(.success(model))
//          case .failure(let error):
//            completion(.failure(error))
//          }
//        }
//      case .failure(let error):
//        completion(.failure(error))
//      }
//    }
//  }
//}
//
//class APIHandler {
//  func getComment(url: URL, completion: @escaping (Result<Data, DemoError> ) -> Void) {
//
//    URLSession.shared.dataTask(with: url) { data, respond, error in
//
//      guard let data = data, error == nil else {
//        return completion(.failure(.NoData))
//      }
//      completion(.success(data))
//    }.resume()
//  }
//
//  func getUser(url: URL, completion: @escaping (Result<Data, DemoError> ) -> Void) {
//
//    URLSession.shared.dataTask(with: url) { data, respond, error in
//
//      guard let data = data, error == nil else {
//        return completion(.failure(.NoData))
//      }
//      completion(.success(data))
//    }.resume()
//  }
//}
//
//class ResponseHandler {
//  func getComment(data: Data, completion: @escaping (Result<[CommentModel], DemoError> ) -> Void) {
//    let commentRespons = try? JSONDecoder().decode([CommentModel].self, from: data)
//    if let commentRespons = commentRespons {
//      return completion(.success(commentRespons))
//    } else {
//      return completion(.failure(.DecodingError))
//    }
//  }
//
//  func getUser(data: Data, completion: @escaping (Result<UserModel, DemoError> ) -> Void) {
//    let commentRespons = try? JSONDecoder().decode(UserModel.self, from: data)
//    if let commentRespons = commentRespons {
//      return completion(.success(commentRespons))
//    } else {
//      return completion(.failure(.DecodingError))
//    }
//  }
//}
//
