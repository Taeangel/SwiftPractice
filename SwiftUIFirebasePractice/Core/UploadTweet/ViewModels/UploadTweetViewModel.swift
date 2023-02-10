//
//  UploadTweetViewModel.swift
//  SwiftUIFirebasePractice
//
//  Created by song on 2023/01/29.
//

import Foundation
import Combine

class UploadTweetViewModel: ObservableObject {
  @Published var didUploadTweet = false
  private var cancellabels: Set<AnyCancellable>
  let service = TweetService()
  
  init() {
    self.cancellabels = .init()
  }
  
  func uploadTweet(withCaption caption: String) {
    //    service.uploadTweet(caption: caption) { success in
    //      if success {
    //        self.didUploadTweet = true
    //      } else {
    //        self.didUploadTweet = false
    //      }
    //    }
    
    service.uploadTweetCombine(caption: caption)
      .sink(receiveCompletion: { _ in },
            receiveValue: { [weak self] isSuccess in
        self?.didUploadTweet = isSuccess
      })
      .store(in: &cancellabels)
  }
}
