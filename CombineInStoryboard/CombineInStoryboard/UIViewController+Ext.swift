//
//  UIViewController+Ext.swift
//  CombineInStoryboard
//
//  Created by song on 2022/11/03.
//

import UIKit

protocol StoryBoarded {
  static func instantiate(_ storyboardName: String) -> Self
}

extension StoryBoarded where Self: UIViewController {
  static func instantiate(_ storyboardName: String) -> Self {
    let numbersStroyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main)
    return numbersStroyboard.instantiateViewController(withIdentifier: String(describing: self)) as! Self
  }
}
