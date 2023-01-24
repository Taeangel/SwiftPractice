//
//  AppMain.swift
//  TCAProject
//
//  Created by song on 2022/12/02.
//

import SwiftUI
import Dependencies
import LinkNavigator

@main
struct AppMain: App {
  @Dependency(\.sideEffect) var sideEffect
  
  var navigator: LinkNavigator {
    sideEffect.linkNavigator as! LinkNavigator
  }

  var body: some Scene {
    WindowGroup {
      navigator
        .launch(paths: ["main"], items: [:])
    }
  }
}

