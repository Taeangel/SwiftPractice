//
//  DetailCore.swift
//  TCACoordinator
//
//  Created by song on 2022/09/29.
//

import Foundation
import ComposableArchitecture

struct DetailState: Equatable {
  var title: Int
  
  init(title: Int) {
    self.title = title
  }
}

enum DetailAction {
  case backButtonTapped
}

struct DetailEnvironment {
}

let detailReducer = Reducer<DetailState, DetailAction, DetailEnvironment> { state, action, environment in
  switch action {
  case .backButtonTapped:
    return Effect.none
  }
}
