//
//  ContentView.swift
//  TCAProject
//
//  Created by song on 2022/12/02.
//
import SwiftUI
import ComposableArchitecture

struct SettingView: View {
  private let store: StoreOf<SettingReducer>
  @ObservedObject var viewStore: ViewStoreOf<SettingReducer>

   init(store: StoreOf<SettingReducer>) {
    self.store = store
    viewStore = ViewStore(store)
  }
  
  var body: some View {
    VStack {
      Text("settingView입니다.")
      Button("되돌아 가기 버튼 입니다.") {
        viewStore.send(.routeToBack)
      }
    }
    .onAppear {
      viewStore.send(.getPaths)
    }
  }
}
