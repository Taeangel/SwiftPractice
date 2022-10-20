//
//  SingleResponsibilityPrinsipal.swift
//  SOLID Practice
//
//  Created by song on 2022/10/20.
//

import Foundation


// MARK: - after

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
//
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
//}
//
//class APIHandler {
//
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
//}
//
//class ResponseHandler {
//
//  func getComment(data: Data, completion: @escaping (Result<[CommentModel], DemoError> ) -> Void) {
//    let commentRespons = try? JSONDecoder().decode([CommentModel].self, from: data)
//    if let commentRespons = commentRespons {
//      return completion(.success(commentRespons))
//    } else {
//      return completion(.failure(.DecodingError))
//    }
//  }
//}


// MARK: - Before

//class NetworkManager {
//
//  func getComment(completion: @escaping (Result<[CommentModel], DemoError> ) -> Void) {
//
//    guard let url = URL(string: "유알엘쓰는칸입니다") else {
//      return completion(.failure(.BadURL))
//    }
//
//    URLSession.shared.dataTask(with: url) { data, respond, error in
//
//
//      guard let data = data, error == nil else {
//        return completion(.failure(.NoData))
//      }
//
//      let commentResponse = try? JSONDecoder().decode([CommentModel].self, from: data)
//
//      if let commentResponse = commentResponse {
//        return completion(.success(commentResponse))
//      } else {
//        completion(.failure(.DecodingError))
//      }
//    }.resume()
//  }
//}
