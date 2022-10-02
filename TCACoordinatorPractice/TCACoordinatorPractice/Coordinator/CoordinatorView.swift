//
//  CoordinatorView.swift
//  TCACoordinator
//
//  Created by song on 2022/09/29.
//

import SwiftUI
import TCACoordinators
import ComposableArchitecture

struct CoordinatorView: View {
  let store: Store<CoordinatorState, CoordinatorAction>
  
  var body: some View {
    TCARouter(store) { screen in
      SwitchStore(screen) {
        CaseLet(
          state: /ScreenState.home,
          action: ScreenAction.home,
          then: HomeView.init
        )
        CaseLet(
          state: /ScreenState.detail,
          action: ScreenAction.detail,
          then: DetailView.init
        )
      }
    }
  }
}
