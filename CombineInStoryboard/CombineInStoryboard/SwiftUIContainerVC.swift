//
//  SwiftUIContainerVC.swift
//  CombineInStoryboard
//
//  Created by song on 2022/11/03.
//
import UIKit
import SwiftUI
import Foundation

class NumbersSwiftUiViewContainerVC<SwiftUIView: View>: UIViewController {
  
  let swiftUIView: SwiftUIView
  
  init(swiftUIView: SwiftUIView) {
    self.swiftUIView = swiftUIView
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
     super.viewDidLoad()
    self.view.backgroundColor = .white
    
    self.configureHostingVC()
  }
  
  fileprivate func configureHostingVC() {
    let hostingController = UIHostingController(rootView: swiftUIView)
    hostingController.view.translatesAutoresizingMaskIntoConstraints = false
    self.addChild(hostingController)
    self.view.addSubview(hostingController.view)
    hostingController.didMove(toParent: self)
    NSLayoutConstraint.activate([
      hostingController.view.topAnchor.constraint(equalTo: self.view.topAnchor),
      hostingController.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
      hostingController.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
      hostingController.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
    ])
  }
}
