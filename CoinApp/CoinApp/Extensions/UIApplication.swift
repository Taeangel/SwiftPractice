//
//  UIApplication.swift
//  CoinApp
//
//  Created by song on 2022/11/22.
//

import Foundation
import SwiftUI

extension UIApplication {
  func endEditing() {
    sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
  }
}
