//
//  SideMenuViewModel.swift
//  SwiftUIFirebasePractice
//
//  Created by song on 2023/01/26.
//

import Foundation

enum SideMenuViewModel: Int, CaseIterable {
  case profile
  case logout
  
  var title: String {
    switch self {
    case .profile:
      return "Profile"
    case .logout:
      return "Logout"
    }
  }
  
  var imageName: String {
    switch self {
    case .profile:
      return "person"
    case .logout:
      return "arrow.left.square"
      
    }
  }
}
