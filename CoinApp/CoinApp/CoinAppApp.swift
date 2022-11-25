//
//  CoinAppApp.swift
//  CoinApp
//
//  Created by song on 2022/11/18.
//

import SwiftUI

@main
struct CoinAppApp: App {
  
  @StateObject var vm = HomeViewModel()
  
  init() {
    UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
    UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
  }
  
  var body: some Scene {
    WindowGroup {
      NavigationView {
        HomeView()
          .toolbar(.hidden)
      }
      .environmentObject(vm)
    }
  }
}
