//
//  SwiftUIContainerViewModel.swift
//  CombineInStoryboard
//
//  Created by song on 2022/11/03.
//

import Foundation
import UIKit
import Combine
import SwiftUI

class SwiftUIContainerViewModel: ObservableObject {
  
  //input = 뷰모델로 들어오는 친구
  @Published var number1: String = ""
  @Published var number2: String = ""
  @Published var number3: String = ""
  @Published var number4: String = ""
  
  //output = 뷰모델에서 나가는 친구
  @Published var resultValue: String = ""
  var subscriptions = Set<AnyCancellable>()
  
  init() {
    subscription()
  }
  
  func subscription() {
    Publishers
      .CombineLatest4($number1,
                      $number2,
                      $number3,
                      $number4)
      .map { n1, n2, n3, n4 -> Int in
        return  n1.getNumber() + n2.getNumber() + n3.getNumber() + n4.getNumber()
      }
      .map { String($0) }
      .sink {  self.resultValue = $0   }
      .store(in: &subscriptions)
    
  }
}

extension String {
  
  fileprivate func getNumber() -> Int {
    return Int(self) ?? 0
  }
}
