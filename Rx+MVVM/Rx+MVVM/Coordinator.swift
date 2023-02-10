//
//  Coordinator.swift
//  Rx+MVVM
//
//  Created by song on 2023/02/01.
//

import UIKit

class Coordinator {
  let window: UIWindow
  
  init(window: UIWindow) {
    self.window = window
  }
  
  func start() {
    let rootViewController = RootViewController(viewModel: RootViewModel(articleService: ArtocleService()))
    let navigationRootViewController = UINavigationController(rootViewController: rootViewController)
    window.rootViewController = navigationRootViewController
    window.makeKeyAndVisible()//화면에 렌더링 시켜주는 함수
  }
}
