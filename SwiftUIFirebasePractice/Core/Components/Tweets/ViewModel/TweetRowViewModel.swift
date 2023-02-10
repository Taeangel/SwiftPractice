//
//  TweetRowViewModel.swift
//  SwiftUIFirebasePractice
//
//  Created by song on 2023/01/31.
//

import Foundation

class TweetRowViewModel: ObservableObject {
  @Published var tweet: Tweet
  private let service = TweetService()
  init(tweet: Tweet) {
    self.tweet = tweet
    checkIfUserLikedTweet()
  }
  
  func likeTweet() {
    service.likeTweet(tweet) { 
      self.tweet.didLike = true
    }
  }
  
  func checkIfUserLikedTweet() {
    service.checkIfUserLikedTweet(tweet) { didLike in
      if didLike {
        self.tweet.didLike = true
      }
    }
  }
  
  func unlikeTweet() {
    service.unlikeTweet(tweet) {
      self.tweet.didLike = false
    }
  }
}
