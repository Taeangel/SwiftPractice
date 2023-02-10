//
//  FeedViewModel.swift
//  SwiftUIFirebasePractice
//
//  Created by song on 2023/01/29.
//

import Firebase
import Foundation

class FeedViewModel: ObservableObject {
  @Published var tweets: [Tweet] = []
  let service = TweetService()
  let userService = UserService()
  
  init() {
    self.fetchTweets()
  }
  
  func fetchTweets() {
    service.fetchTweets { tweets in
      self.tweets = tweets
      
      for i in 0 ..< tweets.count {
        let uid = tweets[i].uid
        self.userService.fetchUser(withUid: uid) { user in
          self.tweets[i].user = user
        }
        
      }
      
    }
  }
}
