//
//  CustomTabBarContainerView.swift
//  CustomTabView
//
//  Created by song on 2022/10/10.
//

import SwiftUI

struct CustomTabBarContainerView<Content: View>: View {
  
  @Binding var selection: TabBarItem
  let content: Content
  @State private var tabs: [TabBarItem] = []
  
  init(selection: Binding<TabBarItem>, @ViewBuilder content: () -> Content) {
    self._selection = selection
    self.content = content()
  }
    var body: some View {
      
      VStack {
        ZStack {
          content
        }
        CustomTabBarView(tabs: tabs, selection: $selection)
      }
      .onPreferenceChange(TabBarItemsPreferenceKey.self ,perform: { value in
        self.tabs = value
      })
    }
}

struct CustomTabBarContainerView_Previews: PreviewProvider {
  static let tabs: [TabBarItem] = [
    TabBarItem.home,
    TabBarItem.favorites,
    TabBarItem.profile
  ]
    static var previews: some View {
      CustomTabBarContainerView(selection: .constant(tabs.first!)) {
        Color.red
      }
    }
}
