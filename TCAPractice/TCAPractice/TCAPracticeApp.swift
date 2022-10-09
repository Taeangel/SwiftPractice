//
//  TCAPracticeApp.swift
//  TCAPractice
//
//  Created by song on 2022/09/25.
//

import SwiftUI
import ComposableArchitecture

@main
struct TCAPracticeApp: App {
  
  let counterStore = Store(initialState: CounterState(), reducer: counterReducer, environment: CounterEnvironment())
  
  let memoStore = Store(initialState: MemoState(),
                        reducer: memoReducer,
                        environment: MemoEnvironment(memoClient: MemoClient.live,
                                                     mainQueue: .main))
  
  var body: some Scene {
    WindowGroup {
//           CounterView(store: counterStore)
      MemoView(store: memoStore)
    }
  }
}
