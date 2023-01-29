//
//  UploadTweetViewModel.swift
//  SwiftUIFirebasePractice
//
//  Created by song on 2023/01/29.
//

import Foundation

class UploadTweetViewModel: ObservableObject {
  @Published var didUploadTweet = false
  
  let service = TweetService()
  
  func uploadTweet(withCaption caption: String) {
    service.uploadTweet(caption: caption) { success in
      if success {
        self.didUploadTweet = true
      } else {
        self.didUploadTweet = false
      }
    }
  }
}
