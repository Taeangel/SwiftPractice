//
//  TwitterService.swift
//  SwiftUIFirebasePractice
//
//  Created by song on 2023/01/29.
//

import Firebase
import FirebaseFirestoreSwift
import Combine

struct TweetService {
  
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
    
    db.collection("tweets")
      .order(by: "timestamp", descending: true)
      .getDocuments { snapshot, _ in
        guard let documents = snapshot?.documents else { return }
        
        let tweets = documents.compactMap { try? $0.data(as: Tweet.self) }
        completion(tweets)
      }
  }
  
  func fetchTweets(forUid uid: String, completion: @escaping([Tweet]) -> ()) {
    db.collection("tweets")
      .whereField("uid", isEqualTo: uid)
      .getDocuments { snapshot, _ in
        guard let documents = snapshot?.documents else { return }
        
        let tweets = documents
          .compactMap { try? $0.data(as: Tweet.self) }
          .sorted { $0.timestamp.dateValue() > $1.timestamp.dateValue() }
        completion(tweets)
      }
  }
  
  func likeTweet(_ tweet: Tweet, compeltion: @escaping() -> ()) {
    guard let uid = Auth.auth().currentUser?.uid else { return }
    guard let tweetId = tweet.id else { return }
    
    let userLikesRef = Firestore.firestore().collection("users").document(uid).collection("user-likes")
    
    Firestore.firestore().collection("tweets").document(tweetId)
      .updateData(["likes": tweet.likes + 1]) { _ in
        userLikesRef.document(tweetId).setData([:]) { _ in
          compeltion()
        }
        
      }
  }
  
  func checkIfUserLikedTweet(_ tweet: Tweet, completion: @escaping (Bool) -> ()) {
    guard let uid = Auth.auth().currentUser?.uid else { return }
    guard let tweetId = tweet.id else { return }
    Firestore.firestore().collection("users").document(uid).collection("user-likes").document(tweetId).getDocument { snapshot, _ in
      guard let snapshot = snapshot else { return }
      completion(snapshot.exists)
    }
  }
  
  func unlikeTweet(_ tweet: Tweet, completion: @escaping () -> ()) {
    guard let uid = Auth.auth().currentUser?.uid else { return }
    guard let tweetId = tweet.id else { return }
    guard tweet.likes > 0 else { return }
    let userLikesRef = Firestore.firestore().collection("users").document(uid).collection("user-likes")
    Firestore.firestore().collection("tweets").document(tweetId).updateData(["likes": tweet.likes - 1]) { _ in
      userLikesRef.document(tweetId).delete { _ in
        completion()
      }
    }
  }
  
  func fetchLinkedTweets(forUid uid: String, completion: @escaping([Tweet]) -> ()) {
    var tweets: [Tweet] = []
    
    Firestore.firestore().collection("users").document(uid).collection("user-likes").getDocuments { snapshot, _ in
      guard let documents = snapshot?.documents else { return }
      
      documents.forEach { doc in
        let tweetID = doc.documentID
        Firestore.firestore().collection("tweets").document(tweetID).getDocument { snapshot, _ in
          guard let tweet = try? snapshot?.data(as: Tweet.self) else { return }
          tweets.append(tweet)
          completion(tweets)
        }
      }
    }
  }
}
