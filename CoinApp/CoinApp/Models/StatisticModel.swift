//
//  StatisticModel.swift
//  CoinApp
//
//  Created by song on 2022/11/22.
//

import Foundation

struct StatisticModel: Identifiable {
  let id = UUID().uuidString
  let title: String
  let value: String
  let percentageChaange: Double?
  
  init(
    title: String,
    value: String,
    percentageChaange: Double? = nil
  ) {
    self.title = title
    self.value = value
    self.percentageChaange = percentageChaange
  }
}

