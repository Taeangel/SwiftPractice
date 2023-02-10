//
//  Tweet.swift
//  SwiftUIFirebasePractice
//
//  Created by song on 2023/01/29.
//

import FirebaseFirestoreSwift
import Firebase

struct Tweet: Identifiable, Decodable {
  @DocumentID var id: String?
  let caption: String
  let timestamp: Timestamp
  let uid: String
  var likes: Int
  
  var user: TwitterUser?
  var didLike: Bool? = false
}
