//
//  NavigationRouter.swift
//  CoordinatorPatternSwiftUI Practice
//
//  Created by song on 2022/10/06.
//

import SwiftUI

public protocol NavigationRouter {
  
  associatedtype V: View
  
  var transition: NavigationTranisitionStyle { get }
  
  @ViewBuilder
  func view() -> V
}





