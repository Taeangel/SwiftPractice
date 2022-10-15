//
//  SecondCoordinator.swift
//  CoordinatorPatternPractice
//
//  Created by song on 2022/10/14.
//

import UIKit


class SecondTabCoordinator: Coordinator {
  
  var rootViewController = UINavigationController()
  
  lazy var secondViewController: SecondViewController = {
    let vc = SecondViewController()
    vc.title = "Second"
    return vc
  }()
  
  func start() {
    rootViewController.setViewControllers([secondViewController], animated: false)
  }
}
