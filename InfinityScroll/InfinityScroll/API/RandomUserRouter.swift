//
//  RandomUserRouter.swift
//  InfinityScroll
//
//  Created by song on 2022/10/04.
//

import Foundation
import Alamofire


let BASE_URL = "https://randomuser.me/api/?page=3&results=10&seed=abc"

enum RandomUserRouter: URLRequestConvertible {
  case getUser(page: Int = 1, results: Int = 20)

  var baseURL: URL {
    return URL(string: BASE_URL)!
  }
 
  var endPoint: String {
    switch self {
    case .getUser:
      return ""
    default:
      return ""
    }
  }
  
  var method: HTTPMethod {
    switch self {
    case .getUser:
      return .get
    default:
      return .get
    }
  }
  
  var parameters: Parameters {
    switch self {
    case let .getUser(page, results):
      var params = Parameters()
      params["page"] = page
      params["result"] = results
      params["seed"] = "???"
      return params
    default: return Parameters()
      
    }
  }
  
  func asURLRequest() throws -> URLRequest {
    let url = baseURL.app
  }
}
