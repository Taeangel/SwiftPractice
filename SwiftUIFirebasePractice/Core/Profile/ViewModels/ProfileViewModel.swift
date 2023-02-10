//
//  ProfileViewModel.swift
//  SwiftUIFirebasePractice
//
//  Created by song on 2023/01/31.
//

import Foundation

class ProfileViewModel: ObservableObject {
  @Published var tweets: [Tweet] = []
  @Published var likedTweets: [Tweet] = []
  let service = TweetService()
  let userService = UserService()
  let user: TwitterUser
  
  init(user: TwitterUser) {
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
    service.fetchTweets(forUid: uid) { tweets in
      self.tweets = tweets
      
      for i in 0 ..< tweets.count {
        self.tweets[i].user = self.user
      }
    }
  }
  
  func fetchLinkedTweets() {
    guard let uid = user.id else { return }
    
    service.fetchTweets(forUid: uid) { tweets in
      self.likedTweets = tweets
      
      for i in 0 ..< tweets.count {
        let uid = tweets[i].uid
        self.userService.fetchUser(withUid: uid) { user in
          self.likedTweets[i].user = user
        }
        
      }
    }
  }
}
 
