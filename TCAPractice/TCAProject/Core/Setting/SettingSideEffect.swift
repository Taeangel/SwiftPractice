//
//  MainCoinSideEffect.swift
//  TCAProject
//
//  Created by song on 2022/12/02.
//

import LinkNavigator

protocol SettingSideEffect {
  var getPaths: () -> [String] { get }
  var routeToBack: () -> Void { get }
}

struct SettingSideEffectLive {
  let navigator: LinkNavigatorType
  
  init(navigator: LinkNavigatorType) {
    self.navigator = navigator
  }
}

extension SettingSideEffectLive: SettingSideEffect {
  var getPaths: () -> [String] {
    { navigator.currentPaths }
  }
  
  var routeToBack: () -> Void {
    { navigator.back(isAnimated: true) }
  }
}
