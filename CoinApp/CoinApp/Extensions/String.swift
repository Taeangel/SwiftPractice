//
//  String.swift
//  CoinApp
//
//  Created by song on 2022/11/29.
//

import Foundation

extension String {
  
  var removingHTMLOccurances: String {
    return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
  }
}
