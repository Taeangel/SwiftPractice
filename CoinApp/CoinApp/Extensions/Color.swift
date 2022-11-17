//
//  Color.swift
//  CoinApp
//
//  Created by song on 2022/11/18.
//

import Foundation
import SwiftUI

extension Color {
  static let theme = ColorTheme()
}

struct ColorTheme {
  
  let accent = Color("AccentColor")
  let background = Color("BackgroundColor")
  let green = Color("GreenColor")
  let red = Color("RedColor")
  let secondaryText = Color("SecondaryTextColor")
}
