//
//  SwiftUIFirebasePracticeApp.swift
//  SwiftUIFirebasePractice
//
//  Created by song on 2023/01/24.
//

import SwiftUI
import Firebase

@main
struct SwiftUIFirebasePracticeApp: App {
  
  @StateObject var viewModel = AuthViewModel()
  
  init() {
    FirebaseApp.configure()
  }
  
  var body: some Scene {
    WindowGroup {
      NavigationView {
        ContentView()
//        ProfilePhotoSelectorView()
      }
      .environmentObject(viewModel)
    }
  }
}

