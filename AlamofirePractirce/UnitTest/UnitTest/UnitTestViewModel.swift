//
//  UnitTestViewModel.swift
//  UnitTest
//
//  Created by song on 2022/12/30.
//

import SwiftUI

class UnitTestViewModel: ObservableObject {
  @Published var isPremium: Bool
  @Published var dataArray: [String] = []
  
  init(isPremium: Bool) {
    self.isPremium = isPremium
  }
  
  func addItem(item: String) {
    guard !item.isEmpty else { return }
    self.dataArray.append(item)
  }
}
