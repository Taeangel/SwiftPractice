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
