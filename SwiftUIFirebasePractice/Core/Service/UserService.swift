//
//  UserService.swift
//  SwiftUIFirebasePractice
//
//  Created by song on 2023/01/29.
//

import Firebase
import FirebaseFirestoreSwift
import CombineExt
import Combine

struct UserService {
  let db = Firestore.firestore()
  
  func fetchUser(withUid uid: String, completion: @escaping(TwitterUser) -> ()) {
    db.collection("users")
      .document(uid)
      .getDocument { snapshot , _ in
        guard let snapshot = snapshot else { return }
        
        guard let user = try? snapshot.data(as: TwitterUser.self) else {
          return
        }
        completion(user)
      }
  }
  
  func fetchUsers(completion: @escaping([TwitterUser]) -> ()) {
    db.collection("users")
      .getDocuments { snapshot, _ in
        guard let documents = snapshot?.documents else { return }
        let users = documents.compactMap { try? $0.data(as: TwitterUser.self) }

        completion(users)
      }
  }
}

extension UserService {
//  func fetchUser(withUid uid: String) -> AnyPublisher<TwitterUser, Error> {
//    return AnyPublisher<TwitterUser, Error>.create { subscriber in
//      fetchUser(withUid: uid) { user in
//
//      }
//    }
//  }
}
