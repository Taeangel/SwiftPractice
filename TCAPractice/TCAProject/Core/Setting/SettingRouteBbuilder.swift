//
//  MainCoinRouteBbuilder.swift
//  TCAProject
//
//  Created by song on 2022/12/02.
//

import LinkNavigator
import SwiftUI

struct SettingRouteBuilder: RouteBuilder {
  var matchPath: String { "setting" }

  var build: (LinkNavigatorType, [String: String], DependencyType) -> UIViewController? {
    { navigator, items, dependency in
      return WrappingController(matchingKey: matchPath) {
        AnyView(SettingView(store: .init(initialState: SettingReducer.State(), reducer: SettingReducer())))
      }
    }
  }
}
