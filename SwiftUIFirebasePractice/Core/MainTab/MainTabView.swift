//
//  MainTabView\.swift
//  SwiftUIFirebasePractice
//
//  Created by song on 2023/01/24.
//

import SwiftUI

struct MainTabView: View {
  @State private var selectedIndex = 0
  
  var body: some View {
    
    TabView(selection: $selectedIndex) {
      FeedView()
        .onTapGesture {
          self.selectedIndex = 0
        }
        .tabItem {
          Image(systemName: "house")
        }
        .tag(0)
      
      ExploreView()
        .onTapGesture {
          self.selectedIndex = 1
        }
        .tabItem {
          Image(systemName: "magnifyingglass")
        }
        .tag(1)
    }
  }
}

struct MainTabView__Previews: PreviewProvider {
  static var previews: some View {
    MainTabView()
  }
}
