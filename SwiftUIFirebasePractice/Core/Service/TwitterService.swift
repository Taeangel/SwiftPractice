//
//  TwitterService.swift
//  SwiftUIFirebasePractice
//
//  Created by song on 2023/01/29.
//

import Firebase
import FirebaseFirestoreSwift

struct TweetService {
  let db = Firestore.firestore()
  func uploadTweet(caption: String, completion: @escaping(Bool) -> ()) {
    guard let uid = Auth.auth().currentUser?.uid else { return }
    
    let data = ["uid": uid,
                "caption": caption,
                "likes": 0,
                "timestamp": Timestamp(date: Date())] as [String: Any]
    
    db.collection("tweets")
      .document()
      .setData(data) { error in
        if let error {
          print("DEBUG: fail to upload\(error)")
          completion(false)
          return
        }
        
        completion(true)
      }
  }
  
  func fetchTweets(completion: @escaping([Tweet]) -> ()) {
    db.collection("tweets").getDocuments { snapshot, _ in
      guard let documents = snapshot?.documents else { return }
      print(documents.count)
      let tweets = documents.compactMap { try? $0.data(as: Tweet.self) }
      print(tweets.count)
      print(tweets.count)
      completion(tweets)
    }
  }
  
}
