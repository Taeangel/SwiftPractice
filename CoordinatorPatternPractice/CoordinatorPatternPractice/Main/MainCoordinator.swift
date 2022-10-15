//
//  MainCoordinator.swift
//  CoordinatorPatternPractice
//
//  Created by song on 2022/10/14.
//

import UIKit
//import SwiftUI

class MainCoordinator: Coordinator {
  
  var rootViewController = UITabBarController()
  
  var childCoordinator = [Coordinator]()
  
  func start() {
    let firstCoordinator = FirstTabCoordinator()
    firstCoordinator.start()
    self.childCoordinator.append(firstCoordinator)
    let firstViewController = firstCoordinator.rootViewController
    firstViewController.tabBarItem = UITabBarItem(title: "First", image: UIImage(named: "paperplane"), selectedImage: UIImage(named: "paperplane"))
    
    let secondCoordinator = SecondTabCoordinator()
    secondCoordinator.start()
    self.childCoordinator.append(secondCoordinator)
    let secondViewController = secondCoordinator.rootViewController
    secondViewController.tabBarItem = UITabBarItem(title: "Second", image: UIImage(named: "paperplane"), selectedImage: UIImage(named: "paperplane"))
    
    self.rootViewController.viewControllers = [firstCoordinator.rootViewController, secondCoordinator.rootViewController]
  }
}
