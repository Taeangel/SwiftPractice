//
//  ProfileViewModel.swift
//  SwiftUIFirebasePractice
//
//  Created by song on 2023/01/31.
//

import Foundation
import Combine

class ProfileViewModel: ObservableObject {
  @Published var tweets: [Tweet] = []
  @Published var likedTweets: [Tweet] = []
  let service = TweetService()
  let userService = UserService()
  let user: TwitterUser
  private var cancellables: Set<AnyCancellable>
  
  init(user: TwitterUser) {
    self.cancellables = .init()
    self.user = user
    self.fetchUserTweets()
  }
  
  func tweets(forFilter filter: TweetFilterViewModel) -> [Tweet] {
    switch filter {
    case .tweets:
      return tweets
    case .replies:
      return tweets
    case .likes:
      return likedTweets
    }
  }
  
  func fetchUserTweets() {
    guard let uid = user.id else { return }
    
//    service.fetchTweets(forUid: uid) { tweets in
//      self.tweets = tweets
//      
//      for i in 0 ..< tweets.count {
//        self.tweets[i].user = self.user
//      }
//    }
    
    service.fetchTweetsCombine(forUid: uid)
      .sink(receiveCompletion: { _ in },
            receiveValue: { tweets in
        self.tweets = tweets

        for i in 0 ..< tweets.count {
          self.tweets[i].user = self.user
        }
      })
      .store(in: &cancellables)
  }
  
  func fetchLinkedTweets() {
    guard let uid = user.id else { return }
    
//    service.fetchTweets(forUid: uid) { tweets in
//      self.likedTweets = tweets
//
//      for i in 0 ..< tweets.count {
//        let uid = tweets[i].uid
//        self.userService.fetchUser(withUid: uid) { user in
//          self.likedTweets[i].user = user
//        }
//
//      }
//    }
    
    service.fetchTweetsCombine(forUid: uid)
      .sink(receiveCompletion: { _ in },
            receiveValue: { tweets in
        self.likedTweets = tweets
        for i in 0 ..< tweets.count {
          let uid = tweets[i].uid
          self.userService.fetchUser(withUid: uid) { user in
            self.likedTweets[i].user = user
          }

        }
      })
      .store(in: &cancellables)
  }
}
 
