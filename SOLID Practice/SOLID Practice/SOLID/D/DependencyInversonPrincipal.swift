
// MARK: -  after

//class NetworkManager {
//
//  let apiHandler: APIHandlerDelegate
//  let responseHandler: ResponseHandlerDelegate
//
//  init(
//    apiHandler: APIHandlerDelegate = APIHandler(),
//    responseHandler: ResponseHandlerDelegate = ResponseHandler()
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
//protocol APIHandlerDelegate {
//  func fetchData(url: URL, completion: @escaping (Result<Data, DemoError> ) -> Void)
//}
//
//class APIHandler: APIHandlerDelegate {
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
//protocol ResponseHandlerDelegate {
//  func fetchModel<T: Codable>(type: T.Type, data: Data, completion: @escaping (Result<T, DemoError> ) -> Void)
//}
//
//class ResponseHandler: ResponseHandlerDelegate {
//  func fetchModel<T: Codable>(type: T.Type, data: Data, completion: @escaping (Result<T, DemoError> ) -> Void) {
//    let commentRespons = try? JSONDecoder().decode(type.self, from: data)
//    if let commentRespons = commentRespons {
//      return completion(.success(commentRespons))
//    } else {
//      return completion(.failure(.DecodingError))
//    }
//  }
//}



// MARK: - before

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
