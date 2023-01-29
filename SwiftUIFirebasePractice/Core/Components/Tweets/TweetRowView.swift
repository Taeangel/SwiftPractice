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

//struct TweetRowView_Previews: PreviewProvider {
//  static var previews: some View {
//    TweetRowView(tweet: Tweet(caption: "", timestap: "", uid: "", likes: 0))
//  }
//}

extension TweetRowView {
  
  var profileInfoView: some View {
    VStack(alignment: .leading , spacing: 4) {
      HStack {
        Text("Bruce Wayne")
          .font(.subheadline)
          .bold()
        Text("@batman")
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
    Circle()
      .frame(width: 56, height: 56)
      .foregroundColor(Color(.systemBlue))
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
