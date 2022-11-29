//
//  Date.swift
//  CoinApp
//
//  Created by song on 2022/11/29.
//

import Foundation

extension Date {
  
  /// "2021-11-10T14:24:11.849Z"
  init(coinGeckoString: String) {
    
    let fornatter = DateFormatter()
    fornatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    let date = fornatter.date(from: coinGeckoString)
    self.init(timeInterval: 0, since: date ?? Date())
  }
  
  private var shoetFormatter: DateFormatter {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    return formatter
  }
  
  func asShortDateString() -> String {
    return shoetFormatter.string(from: self)
  }
}
