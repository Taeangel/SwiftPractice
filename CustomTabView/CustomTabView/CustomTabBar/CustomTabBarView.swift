//
//  CustomTabBarView.swift
//  CustomTabView
//
//  Created by song on 2022/10/10.
//

import SwiftUI

struct CustomTabBarView: View {
  
  let tabs: [TabBarItem]
  @Binding var selection: TabBarItem
  @Namespace private var namespace
  
    var body: some View {
      tabBarVersion2
    }
}

struct CustomTabBarView_Previews: PreviewProvider {
  static let tabs: [TabBarItem] = [
    TabBarItem.home,
    TabBarItem.favorites,
    TabBarItem.profile
  ]
    static var previews: some View {
      VStack {
        Spacer()
        CustomTabBarView(tabs: tabs, selection: .constant(tabs.first!))
      }
    }
}

extension CustomTabBarView {
  
  private func tabView(tab: TabBarItem) -> some View {
    VStack {
      Image(systemName: tab.iconName)
        .font(.subheadline)
      Text(tab.title)
        .font(.system(size: 10, weight: .semibold, design: .rounded))
    }
    .foregroundColor(selection == tab ? tab.color : Color.gray)
    .foregroundColor(tab.color)
    .padding(.vertical, 8)
    .frame(maxWidth: .infinity)
    .background(selection == tab ? tab.color.opacity(0.2) : Color.clear)
    .cornerRadius(10)
  }
  
  private var tabBarVersion1: some View {
    HStack {
      Spacer()
      ForEach(tabs, id: \.self) { tab in
        tabView(tab: tab)
          .onTapGesture {
            switchTabBar(tab: tab)
          }
      }
    }
    .padding(6)
    .background(Color.white.ignoresSafeArea(edges: .bottom))
  }
  
  private func switchTabBar(tab: TabBarItem) {
    withAnimation(.easeOut) {
      selection = tab
    }
  }
}

extension CustomTabBarView {
  private func tabView2(tab: TabBarItem) -> some View {
    VStack {
      Image(systemName: tab.iconName)
        .font(.subheadline)
      Text(tab.title)
        .font(.system(size: 10, weight: .semibold, design: .rounded))
    }
    .foregroundColor(selection == tab ? tab.color : Color.gray)
    .padding(.vertical, 8)
    .frame(maxWidth: .infinity)
    .background(
      ZStack {
        if selection == tab {
          RoundedRectangle(cornerRadius: 10)
            .fill(tab.color.opacity(0.2))
            .matchedGeometryEffect(id: "background_rectangle", in: namespace)
        }
      }
    )
    .cornerRadius(10)
  }
  
  private var tabBarVersion2: some View {
    HStack {
      ForEach(tabs, id: \.self) { tab in
        tabView2(tab: tab)
          .onTapGesture {
            switchTabBar(tab: tab)
          }
      }
    }
    .padding(6)
    .background(Color.white.ignoresSafeArea(edges: .bottom))
    .cornerRadius(10)
    .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
    .padding(.horizontal)
  }
}
