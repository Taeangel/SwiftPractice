//
//  SwiftUICryptoAppApp.swift
//  SwiftUICryptoApp
//
//  Created by song on 2022/11/09.
//

import SwiftUI

@main
struct SwiftUICryptoAppApp: App {
  
  @StateObject private var vm = HomeViewModel()
  
  var body: some Scene {
    WindowGroup {
      NavigationView {
        HomeView()
          .navigationBarHidden(true)
      }
      .environmentObject(vm)
    }
  }
}
