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

struct MemoState: Equatable {
  var memos: Memos = []
  var selectedMemo: Memo? = nil
  var isLoading: Bool = false
}

// 도메인 + 엑션
enum MemoAction: Equatable {
  case fetchItem(_ id: Int) // 단일 조회
  case fetchItemResponse(Result<Memo, MemoClient.Failure>)
  case fetchAll
  case fetchAllResponse(Result<Memos, MemoClient.Failure>)
}

// 환경설정 주입
struct MemoEnvironment {
  var memoClient: MemoClient
  var mainQueue: AnySchedulerOf<DispatchQueue>
}

// 상태와 엑션을 가지고 있는 리듀서
// 엑션이 들어왔을때 상태를 변경하는 부분

let memoReducer = Reducer<MemoState, MemoAction, MemoEnvironment> { state, action, environment in
  switch action {
    
  case .fetchItem(let memoId):
    enum FetchItemId {}
    state.isLoading = true
    return environment.memoClient
      .fetchMemoItem(memoId)
      .debounce(id: FetchItemId.self,
                for: 0.3,
                scheduler: environment.mainQueue)
      .catchToEffect(MemoAction.fetchItemResponse)
    
  case .fetchItemResponse(.success(let memo)):
    state.selectedMemo = memo
    state.isLoading = false
    return Effect.none
    
  case .fetchItemResponse(.failure):
    state.selectedMemo = nil
    state.isLoading = false
    return Effect.none
    
  case .fetchAll:
    enum FetchAllId {}
    state.isLoading = true
    return environment.memoClient
      .fetchMemos()
      .debounce(id: FetchAllId.self,
                for: 0.3,
                scheduler: environment.mainQueue)
      .catchToEffect(MemoAction.fetchAllResponse)
    
  case .fetchAllResponse(.success(let memos)):
    state.memos = memos
    state.isLoading = false
    return Effect.none
    
  case .fetchAllResponse(.failure):
    state.memos = []
    state.isLoading = false
    return Effect.none
  }
}

struct MemoView: View {
  
  let store: Store<MemoState, MemoAction>
  
  var body: some View {
    WithViewStore(self.store) { viewStore in
      ZStack {
        
        if viewStore.state.isLoading {
          Color.black.opacity(0.3)
            .edgesIgnoringSafeArea(.all)
            .overlay {
              ProgressView().tint(.white)
                .scaleEffect(1.7)
            }.zIndex(1)
        }
        
        List {
          Section(header:
                    VStack(spacing: 8) {
            Button("메모목록가져오기", action: {
              viewStore.send(.fetchAll, animation: .default)
            })
            Text("선택된 메모 정보")
            Text(viewStore.state.selectedMemo?.email ?? "비어있음")
            Text(viewStore.state.selectedMemo?.password ?? "비어있음")
          },
                  content: {
            ForEach(viewStore.state.memos) { aMemo in
              Button(aMemo.name, action: {
                viewStore.send(.fetchItem(aMemo.id), animation: .easeIn)
              })
            }
          })
        }.listStyle(PlainListStyle())
      }
    }
  }
}
