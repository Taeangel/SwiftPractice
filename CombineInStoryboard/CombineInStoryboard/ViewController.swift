//
//  ViewController.swift
//  CombineInStoryboard
//
//  Created by song on 2022/11/03.
//

import UIKit
import Combine
import CombineCocoa


extension UIViewController: StoryBoarded{}

class ViewController: UIViewController {
  @IBOutlet weak var navToNumbersButton: UIButton!
  @IBOutlet weak var navToNumversSwiftUI: UIButton!
  var subscriptions = Set<AnyCancellable>()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navToNumbersButton
      .tapPublisher
      .sink(receiveValue: {
        print(#fileID, #function, #line)
        let numbersVC = NumbersViewController.instantiate("Numbers")
        self.navigationController?.pushViewController(numbersVC, animated: true)
        print("이건되나??")
      })
      .store(in: &subscriptions)
    
    navToNumversSwiftUI
      .tapPublisher
      .sink(receiveValue: {
        print(#fileID, #function, #line)
//        let numbersVC = NumbersSwiftUiViewContainerVC(SwiftUIView: SwiftUIContainerView())

        let numberVC = SwiftUIContainerView().getContainerVC()
        
        self.navigationController?.pushViewController(numberVC, animated: true)
        print("이건되나??")
      })
      .store(in: &subscriptions)
    
  }
}

