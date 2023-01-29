//
//  ExploreViewModel.swift
//  SwiftUIFirebasePractice
//
//  Created by song on 2023/01/29.
//

import Foundation

class ExploreViewModel: ObservableObject {
  @Published var users: [TwitterUser] = []
  @Published var searchText = ""
  let service = UserService()
  
  var searchableUsers: [TwitterUser] {
    if searchText.isEmpty {
      return users
    } else {
      let lowercasedQuery = searchText.lowercased()
      
      return users.filter {
        $0.username.contains(lowercasedQuery) || $0.fullname.lowercased().contains(lowercasedQuery)
      }
      
    }
  }
  init() {
    self.fetchUsers()
  }
  
  func fetchUsers() {
    service.fetchUsers { users in
      self.users = users
    }
  }
}
