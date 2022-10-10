//
//  AppTabBarView.swift
//  CustomTabView
//
//  Created by song on 2022/10/10.
//

// 목표

// generics
// ViewBuilder
// PreferenceKey
// MatchedGeometryEffect

import SwiftUI

struct AppTabBarView: View {
  @State private var selection: String = "home"
  @State private var tabSelection: TabBarItem = .home
  var body: some View {
    CustomTabBarContainerView(selection: $tabSelection) {
      Color.blue
        .tabBarItem(tab: .home, selection: $tabSelection)
      
      Color.red
        .tabBarItem(tab: .favorites, selection: $tabSelection)
      
      Color.green
      .tabBarItem(tab: .profile, selection: $tabSelection)
      
    }
    
  }
}

struct AppTabBarView_Previews: PreviewProvider {
  static let tabs: [TabBarItem] = [
    TabBarItem.home,
    TabBarItem.profile,
    TabBarItem.profile
  ]
  
  static var previews: some View {
    AppTabBarView()
  }
}

extension AppTabBarView {
  
  private var defaultTabView: some View {
    TabView(selection: $selection) {
      Color.red
        .tabItem {
          Text("home")
          Image(systemName: "house")
        }
      
      Color.blue
        .tabItem {
          Text("favorites")
          Image(systemName: "heart")
        }
      
      Color.pink
        .tabItem {
          Text("person")
          Image(systemName: "person")
        }
    }
  }
}
