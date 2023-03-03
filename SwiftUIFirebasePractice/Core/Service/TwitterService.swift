//
//  TwitterService.swift
//  SwiftUIFirebasePractice
//
//  Created by song on 2023/01/29.
//

import Firebase
import FirebaseFirestoreSwift
import CombineExt
import Combine

struct TweetService {
  let db = Firestore.firestore()
  
  private func uploadTweet(caption: String, completion: @escaping(Bool) -> ()) {
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
  
  private func fetchTweets(completion: @escaping([Tweet]) -> ()) {
    
    db.collection("tweets")
      .order(by: "timestamp", descending: true)
      .getDocuments { snapshot, _ in
        guard let documents = snapshot?.documents else { return }
        
        let tweets = documents.compactMap { try? $0.data(as: Tweet.self) }
        completion(tweets)
      }
  }
  
  private func fetchTweets(forUid uid: String, completion: @escaping([Tweet]) -> ()) {
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
  
  private func likeTweet(_ tweet: Tweet, compeltion: @escaping() -> ()) {
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
  
  private func checkIfUserLikedTweet(_ tweet: Tweet, completion: @escaping (Bool) -> ()) {
    guard let uid = Auth.auth().currentUser?.uid else { return }
    guard let tweetId = tweet.id else { return }
    Firestore.firestore().collection("users").document(uid).collection("user-likes").document(tweetId).getDocument { snapshot, _ in
      guard let snapshot = snapshot else { return }
      completion(snapshot.exists)
    }
  }
  
  private func unlikeTweet(_ tweet: Tweet, completion: @escaping () -> ()) {
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
  
  private func fetchLinkedTweets(forUid uid: String, completion: @escaping([Tweet]) -> ()) {
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

// MARK: - 레거시 코드인 escaping Service를 combine을 활용하여 AnyPublisher로변경
extension TweetService {
  func uploadTweetCombine(caption: String) -> AnyPublisher<Bool, Error> {
    return AnyPublisher<Bool, Error>.create { subscriber in
      uploadTweet(caption: caption) { subscriber.send($0) }
      return AnyCancellable {}
    }
  }
  
  func fetchTweetsCombine() -> AnyPublisher<[Tweet], Error> {
    return AnyPublisher<[Tweet], Error>.create { subscriber in
      fetchTweets { tweets in
        subscriber.send(tweets)
      }
      return AnyCancellable {}
    }
  }
  
  
  func fetchTweetsCombine(forUid uid: String) -> AnyPublisher<[Tweet], Error> {
    return AnyPublisher<[Tweet], Error>.create { subscriber in
      fetchTweets(forUid: uid) { tweets in
        subscriber.send(tweets)
      }
      return AnyCancellable {}
    }
  }
  
  func likeTweetCombine(_ tweet: Tweet) -> AnyPublisher<Void, Error> {
    return AnyPublisher<Void, Error>.create { subscriber in
      likeTweet(tweet) {
        subscriber.send(completion: .finished)
      }
      return AnyCancellable {}
    }
  }
  
  func checkIfUserLikedTweetCombine(_ tweet: Tweet) -> AnyPublisher<Bool, Error> {
    return AnyPublisher<Bool, Error>.create { subscriber in
      checkIfUserLikedTweet(tweet) { didlike in
        subscriber.send(didlike)
      }
      return AnyCancellable {}
    }
  }
  
  func unlikeTweetCombine(_ tweet: Tweet) -> AnyPublisher<Void, Error> {
    return AnyPublisher<Void, Error>.create { subscriber in
      unlikeTweet(tweet) {
        subscriber.send(completion: .finished)
      }
      return AnyCancellable {}
    }
  }
}
