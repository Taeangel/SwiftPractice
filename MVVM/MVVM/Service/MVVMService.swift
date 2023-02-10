//
//  MVVMService.swift
//  MVVM
//
//  Created by song on 2023/02/02.
//

import Foundation

protocol MVVMService {
  func callAPI(completion: @escaping (Result<ResponseModel, Error>) -> ())
}

class DefaultService: MVVMService {
  func callAPI(completion: @escaping (Result<ResponseModel, Error>) -> ()) {
    RequestModel(param: "????")
      .request(completion: completion)
  }
}
