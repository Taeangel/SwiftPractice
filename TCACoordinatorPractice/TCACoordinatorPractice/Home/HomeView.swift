//
//  ContentView.swift
//  TCACoordinator
//
//  Created by song on 2022/09/29.
//

import SwiftUI
import ComposableArchitecture

struct HomeView: View {
  var store: Store<HomeState, HomeAction>
  var body: some View {
    
    WithViewStore(store) { viewStore in
      List {
        ForEach(viewStore.nums, id: \.self) { num in
          Button(action: {
            viewStore.send(.itemTapped(num))
          }, label: {
            Text("\(num)")
          })
        }
      }
    }
  }
}
