//
//  AppDelegate.swift
//  TCAProject
//
//  Created by song on 2022/12/02.
//

import SwiftUI
import LinkNavigator

final class AppDelegate: NSObject {
  var navigator: LinkNavigator {
    LinkNavigator(dependency: EmptyDependency(), builders: AppRouterGroup().routers)
  }
}

extension AppDelegate: UIApplicationDelegate {
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
    true
  }
}
