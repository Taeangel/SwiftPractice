//
//  TCACoordinatorApp.swift
//  TCACoordinator
//
//  Created by song on 2022/09/29.
//

import SwiftUI

@main
struct TCACoordinatorApp: App {
  var body: some Scene {
    WindowGroup {
      CoordinatorView(store: .init(
        initialState: CoordinatorState(),
        reducer: coordunatorReducer,
        environment: CoordinatorEnvironment()))
    }
  }
}
