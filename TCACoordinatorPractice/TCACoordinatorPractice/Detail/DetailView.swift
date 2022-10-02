//
//  DetailView.swift
//  TCACoordinator
//
//  Created by song on 2022/09/29.
//

import SwiftUI
import ComposableArchitecture

struct DetailView: View {
  var store: Store<DetailState, DetailAction>
  var body: some View {
    WithViewStore(store) { viewStore in
      Text("\(viewStore.title)")
      Button(action: {
        viewStore.send(.backButtonTapped)
      }, label: {
        Text("Go back to list view")
      })
    }.navigationBarBackButtonHidden(true)
  }
}
