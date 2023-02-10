//
//  ResponseModel.swift
//  MVVM
//
//  Created by song on 2023/02/02.
//

import Foundation

struct ResponseModel {
  let strings: [String]
  
  init(json: [String: Any]) {
    self.strings = json["MVVM"].flatMap { $0 as? [String] } ?? []
  }
}
