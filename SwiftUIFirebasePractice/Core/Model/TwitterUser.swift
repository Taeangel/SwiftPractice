//
//  TwitterUser.swift
//  SwiftUIFirebasePractice
//
//  Created by song on 2023/01/29.
//

import FirebaseFirestoreSwift

struct TwitterUser: Identifiable, Decodable {
  @DocumentID var id: String?
  let username: String
  let fullname: String
  let profileImageUrl: String
  let email: String
}
