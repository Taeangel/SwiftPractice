//
//  FirstTabCoordinator.swift
//  CoordinatorPatternPractice
//
//  Created by song on 2022/10/14.
//

import UIKit

class FirstTabCoordinator: Coordinator {
  
  var rootViewController = UINavigationController()
  
  lazy var firstViewController: FirstViewController = {
    let vc = FirstViewController()
    vc.title = "fiasdasdrst"
    return vc
  }()
  
  func start() {
    rootViewController.setViewControllers([firstViewController], animated: false)
  }
}
