//
//  AppSideEffect.swift
//  TCAProject
//
//  Created by song on 2022/12/02.
//

import LinkNavigator
import Dependencies
import Foundation

struct EmptyDependency: DependencyType {}


fileprivate var navigator: LinkNavigatorType = LinkNavigator(
  dependency: EmptyDependency(),
  builders: AppRouterGroup().routers)


 struct AppSideEffect: DependencyKey {
      
  let linkNavigator: LinkNavigatorType
  
  let mainCoin: MainCoinSideEffect
  let setting: SettingSideEffect
  
   static var liveValue: AppSideEffect {
    return .init(linkNavigator: navigator,
                 mainCoin: MainCoinSideEffectLive(navigator: navigator),
                 setting: SettingSideEffectLive(navigator: navigator))
  }
}

extension DependencyValues {
  var sideEffect: AppSideEffect {
    get {self[AppSideEffect.self] }
    set { self[AppSideEffect.self] = newValue }
  }
}
