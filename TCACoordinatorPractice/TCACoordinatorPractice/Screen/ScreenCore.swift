//
//  ScreenCore.swift
//  TCACoordinator
//
//  Created by song on 2022/09/29.
//

import ComposableArchitecture

enum ScreenState: Equatable {
  case home(HomeState)
  case detail(DetailState)
}

enum ScreenAction {
  case home(HomeAction)
  case detail(DetailAction)
}

struct ScreenEnvironment {
  
}

let screenReducer = Reducer<ScreenState, ScreenAction, ScreenEnvironment>.combine([
  homeReducer.pullback(state: /ScreenState.home,
                       action: /ScreenAction.home,
                       environment: {_ in HomeEnvironment()}),
  detailReducer.pullback(state: /ScreenState.detail,
                       action: /ScreenAction.detail,
                       environment: {_ in DetailEnvironment()}),
])
