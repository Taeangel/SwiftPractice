//
//  RequestModel.swift
//  MVVM
//
//  Created by song on 2023/02/02.
//

import Foundation

struct RequestModel: NetworkProtocol {
  let param: String
  
  func response(json: [String: Any]) -> ResponseModel {
    ResponseModel(json: json)
  }
}
