//
//  MemoClient.swift
//  TCAPractice
//
//  Created by song on 2022/09/26.
//

import Foundation
import ComposableArchitecture
//Api 통신
struct MemoClient {
  
  /// 단일 아이템 조회
  var fetchMemoItem: (_ id: Int) -> Effect<Memo, Failure>
  
  var fetchMemos: () -> Effect<Memos, Failure>
  
  struct Failure: Error, Equatable {}
}

extension MemoClient {
  // 메모클라이언트 자체를 반환
  static let live = MemoClient(
    fetchMemoItem: { id in
    Effect.task {
      let (data, _) = try await URLSession.shared
        .data(from: URL(string: "http://localhost:3000/users/\(id)")!)
      return try JSONDecoder().decode(Memo.self, from: data)
    }
    .mapError { _ in Failure() }
    .eraseToEffect()
  }, fetchMemos: {
    Effect.task {
      let (data, _) = try await URLSession.shared
        .data(from: URL(string: "http://localhost:3000/users/")!)
      return try JSONDecoder().decode(Memos.self, from: data)
    }
    .mapError { _ in Failure() }
    .eraseToEffect()
  })
}
