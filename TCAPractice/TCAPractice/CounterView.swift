//
//  ContentView.swift
//  TCAPractice
//
//  Created by song on 2022/09/25.
//

import SwiftUI
import ComposableArchitecture

// 도메인 + 상태
// 도메인이란 어떤거를 만들떄 그 데이터 즉 count가 도메인이다.

struct CounterState: Equatable {
  var count = 0
}
// 도메인 + 엑션
enum CounterAction: Equatable {
  case addCount
  case subtractCount
}

struct CounterEnvironment {
  
}

let counterReducer = Reducer<CounterState, CounterAction, CounterEnvironment> { state, action, environment in
  switch action {
  case .addCount:
    state.count += 1
    return Effect.none
  case .subtractCount:
    state.count -= 1
    return Effect.none
  }
}

struct CounterView: View {
  
  let store: Store<CounterState, CounterAction>
  
  var body: some View {
    WithViewStore(self.store) { viewStore in
      
      VStack {
        Text("\(viewStore.state.count)")
          .padding()
        HStack {
          Button("더하기") { viewStore.send(.addCount) }
          Button("빼기") { viewStore.send(.subtractCount)}
        }
      }
    }
  }
}


//
//struct CounterView_Previews: PreviewProvider {
//  static var previews: some View {
//    CounterView()
//  }
//}
