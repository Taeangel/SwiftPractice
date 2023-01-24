//
//  MainCoinCore.swift
//  TCAProject
//
//  Created by song on 2022/12/02.
//

import ComposableArchitecture
import Dependencies

struct SettingReducer: ReducerProtocol {
  struct State: Equatable {
    var paths: [String] = []
  }
  
  enum Action: Equatable {
    case getPaths
    case routeToBack
  }
  
  @Dependency(\.sideEffect.setting) var sideEffect
  
  var body: some ReducerProtocol<State, Action> {
    
    Reduce { state, action in
      
      switch action {
      case .getPaths:
        state.paths = sideEffect.getPaths()
        return .none
      case .routeToBack:
        sideEffect.routeToBack()
        return .none

      }
    }
  }
}
