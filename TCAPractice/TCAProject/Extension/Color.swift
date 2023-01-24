//
//  Color.swift
//  TCAProject
//
//  Created by song on 2022/12/03.
//

import Foundation
import SwiftUI

extension Color {
  static let theme = AppColor()
}

struct AppColor {
  let accent = Color("AccentColor")
  let background = Color("BackgroundColor")
  let green = Color("GreenColor")
  let red = Color("RedColor")
  let secondaryText = Color("SecondaryTextColor")
}
