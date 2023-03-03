//
//  TweetRowViewModel.swift
//  SwiftUIFirebasePractice
//
//  Created by song on 2023/01/31.
//

import Foundation
import Combine

class TweetRowViewModel: ObservableObject {
  @Published var tweet: Tweet
  private let service = TweetService()
  private var cancellables: Set<AnyCancellable>
  init(tweet: Tweet) {
    self.tweet = tweet
    self.cancellables = .init()
    checkIfUserLikedTweet()
  }
  
  func likeTweet() {
//    service.likeTweet(tweet) {
//      self.tweet.didLike = true
//    }
    
    service.likeTweetCombine(tweet)
      .sink(receiveCompletion: { _ in
        self.tweet.didLike = true
      },
            receiveValue: { _ in
        
      })
      .store(in: &cancellables)
  }
  
  func checkIfUserLikedTweet() {
//    service.checkIfUserLikedTweet(tweet) { didLike in
//      if didLike {
//        self.tweet.didLike = true
//      }
//    }
    
    service.checkIfUserLikedTweetCombine(tweet)
      .sink(receiveCompletion: {_ in},
            receiveValue: { self.tweet.didLike = $0 })
      .store(in: &cancellables)
  }
  
  func unlikeTweet() {
//    service.unlikeTweet(tweet) {
//      self.tweet.didLike = false
//    }
    
    service.unlikeTweetCombine(tweet)
      .sink(receiveCompletion: { _ in
        self.tweet.didLike = false
      }, receiveValue: { _ in })
      .store(in: &cancellables)
  }
}
