//
//  SceneDelegate.swift
//  Coordinator
//
//  Created by song on 2023/02/11.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var applicationCoordinator: ApplicationCoordinator?
  var window: UIWindow?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    let window = UIWindow(windowScene: windowScene)
    let applicationCoordinator = ApplicationCoordinator(window: window)
    applicationCoordinator.start()
    
    self.applicationCoordinator = applicationCoordinator
    window.makeKeyAndVisible()
  }
}


protocol Coordinator {
  func start()
}

class ApplicationCoordinator: Coordinator {
  
  let window: UIWindow
  
  init(window: UIWindow) {
    self.window = window
  }
  
  func start() {
    window.rootViewController = UIHostingController(rootView: ContentView())
  }
}
