//
//  TweetRowView.swift
//  SwiftUIFirebasePractice
//
//  Created by song on 2023/01/24.
//

import SwiftUI
import Kingfisher

struct TweetRowView: View {
  let tweet: Tweet
  var body: some View {
    VStack(alignment: .leading) {
      HStack(alignment: .top, spacing: 12) {
        imageProfileView
        
        profileInfoView
      }
      .padding(.horizontal)
      
      funcTabViews
      
      Divider()
    }
  }
}

extension TweetRowView {
  
  var profileInfoView: some View {
    VStack(alignment: .leading , spacing: 4) {
      HStack {
        Text(tweet.user?.fullname ?? "")
          .font(.subheadline)
          .bold()
        Text("@\(tweet.user?.username ?? "")")
          .foregroundColor(.gray)
          .font(.callout)
        Text("2w")
          .foregroundColor(.gray)
          .font(.caption)
      }
      Text(tweet.caption)
        .font(.subheadline)
        .multilineTextAlignment(.leading)
    }
  }
  
  var imageProfileView: some View {
    KFImage(URL(string: tweet.user?.profileImageUrl ?? ""))
      .resizable()
      .scaledToFill()
      .clipShape(Circle())
      .frame(width: 56, height: 56)
  }
  
  var funcTabViews: some View {
    HStack {
      Button(action: {
        
      },
             label: {
        Image(systemName: "bubble.left")
          .font(.subheadline)
      })
      
      Spacer()
      
      Button(action: {
        
      },
             label: {
        Image(systemName: "arrow.2.squarepath")
          .font(.subheadline)
      })
      
      Spacer()
      
      Button(action: {
        
      },
             label: {
        Image(systemName: "heart")
          .font(.subheadline)
      })
      
      Spacer()
      
      Button(action: {
        
      },
             label: {
        Image(systemName: "bookmark")
          .font(.subheadline)
      })
    }
    .padding()
    .foregroundColor(.gray)
  }
}
