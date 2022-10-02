//
//  HomeCore.swift
//  TCACoordinator
//
//  Created by song on 2022/09/29.

import ComposableArchitecture

struct HomeState: Equatable {
  var nums: [Int]
  
  init(nums: [Int] = Array(1...10)) {
    self.nums = nums
  }
}

enum HomeAction {
  case itemTapped(Int)
}

struct HomeEnvironment {
  
}


let homeReducer = Reducer<HomeState, HomeAction, HomeEnvironment> { state, action, environment in
  switch action {
  case let .itemTapped(num):
    return Effect.none
  }
}
