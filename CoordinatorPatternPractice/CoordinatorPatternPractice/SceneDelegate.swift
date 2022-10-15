//
//  SceneDelegate.swift
//  CoordinatorPatternPractice
//
//  Created by song on 2022/10/14.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  
  var applicationCoordinator: ApplicationCoordinator?
  
  
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    let window = UIWindow(windowScene: windowScene)
    let applicationCoordiantor = ApplicationCoordinator(window: window)
    applicationCoordiantor.start()

    self.applicationCoordinator = applicationCoordiantor
    window.makeKeyAndVisible()
  }
}

