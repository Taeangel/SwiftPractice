//
//  MainCoinRouteBbuilder.swift
//  TCAProject
//
//  Created by song on 2022/12/02.
//

import LinkNavigator
import SwiftUI

struct MainCoinRouteBuilder: RouteBuilder {
  var matchPath: String { "main" }

  var build: (LinkNavigatorType, [String: String], DependencyType) -> UIViewController? {
    { navigator, items, dependency in
      return WrappingController(matchingKey: matchPath) {
        AnyView(HomeView(store: .init(initialState: MainCoinReducer.State(),
                                          reducer: MainCoinReducer())) )
      }
    }
  }
}
