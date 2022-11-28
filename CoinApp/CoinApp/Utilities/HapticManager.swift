//
//  HapticManager.swift
//  CoinApp
//
//  Created by song on 2022/11/26.
//

import Foundation
import SwiftUI

class HapticManager {
  
  static private let generator = UINotificationFeedbackGenerator()
  
  static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
    generator.notificationOccurred(type)
  }
}
