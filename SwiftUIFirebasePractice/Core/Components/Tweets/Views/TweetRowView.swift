//
//  TweetRowView.swift
//  SwiftUIFirebasePractice
//
//  Created by song on 2023/01/24.
//

import SwiftUI
import Kingfisher

struct TweetRowView: View {
  @ObservedObject var viewModel: TweetRowViewModel
  
  init(tweet: Tweet) {
    self.viewModel = TweetRowViewModel(tweet: tweet)
  }

  var body: some View {
    VStack(alignment: .leading) {
      HStack(alignment: .top, spacing: 50) {
        HStack(spacing: 12) {
          imageProfileView
          
          profileInfoView
        }
       
        likeButton
        
      }
      .padding(.horizontal)
      
      Divider()
    }
  }
}

extension TweetRowView {
  
  var likeButton: some View {
    Button(action: {
      viewModel.tweet.didLike ?? false ? viewModel.unlikeTweet() : viewModel.likeTweet()
    },
           label: {
      Image(systemName: viewModel.tweet.didLike ?? false ? "heart.fill" : "heart")
        .font(.headline)
        .foregroundColor(viewModel.tweet.didLike ?? false  ? .red : .gray)
    })
  }
  
  var profileInfoView: some View {
    VStack(alignment: .leading , spacing: 4) {
      HStack {
        Text(viewModel.tweet.user?.fullname ?? "")
          .font(.subheadline)
          .bold()
        Text("@\(viewModel.tweet.user?.username ?? "")")
          .foregroundColor(.gray)
          .font(.callout)
      }
      Text(viewModel.tweet.caption)
        .font(.subheadline)
        .multilineTextAlignment(.leading)
    }
  }
  
  var imageProfileView: some View {
    KFImage(URL(string: viewModel.tweet.user?.profileImageUrl ?? ""))
      .resizable()
      .scaledToFill()
      .clipShape(Circle())
      .frame(width: 56, height: 56)
  }
}
