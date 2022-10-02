//
//  MemoModel.swift
//  TCAPractice
//
//  Created by song on 2022/09/26.
//

import Foundation

struct Memo: Codable, Equatable, Identifiable {
  let id: Int
  let name, email, password: String
}

typealias Memos = [Memo]
