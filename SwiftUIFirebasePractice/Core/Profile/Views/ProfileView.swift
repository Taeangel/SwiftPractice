//
//  ProfileView.swift
//  SwiftUIFirebasePractice
//
//  Created by song on 2023/01/24.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
  @State private var selectionFilter: TweetFilterViewModel = .tweets
  @ObservedObject var viewModel: ProfileViewModel
  @Namespace var animation
  @Environment(\.presentationMode) var mode
  
  init(user: TwitterUser) {
    self.viewModel = ProfileViewModel(user: user)
  }
  
  var body: some View {
    VStack(alignment: .leading, spacing: 30) {
      
      hearderView
      
//      actionButtons
      
      userInfoDetails
      
      tweetFolterBar
      
      tweetsView
      
      Spacer()
    }
    .navigationBarHidden(true)
  }
  
}

//struct ProfileView_Previews: PreviewProvider {
//  static var previews: some View {
//    ProfileView(user: TwitterUser(username: NSUUID().uuidString, fullname: "batman", profileImageUrl: "Bruce", email: "wngks2050@naver.com"))
//  }
//}

extension ProfileView {
  private var hearderView: some View {
    
    ZStack(alignment: .bottomLeading) {
      
      Color(.systemBlue)
        .ignoresSafeArea()
      VStack {
        Button(
          action: {
            self.mode.wrappedValue.dismiss()
          },
          label: {
            Image(systemName: "arrow.left")
              .resizable()
              .frame(width: 20, height: 16)
              .foregroundColor(.white)
              .offset(x: 16, y: -4)
          })
        
        KFImage(URL(string: viewModel.user.profileImageUrl))
          .resizable()
          .scaledToFill()
          .clipShape(Circle())
          .frame(width: 72, height: 72)
          .offset(x: 16, y: 24)
      }
    }
    .frame(height: 88)
  }
  
  private var actionButtons: some View {
    HStack {
      Spacer()
      
      Image(systemName: "bell.badge")
        .font(.title3)
        .padding(6)
        .overlay(Circle().stroke(Color.gray, lineWidth: 0.75))
      
      Button(
        action: {
          
        },
        label: {
          Text("Edit Profile")
            .font(.subheadline)
            .bold()
            .frame(width: 120, height: 32)
            .foregroundColor(.black)
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 0.75))
        })
    }
    .padding(.trailing)
  }
  
  private var userInfoDetails: some View {
    VStack(alignment: .leading, spacing: 4) {
      HStack {
        Text(viewModel.user.fullname)
          .font(.title2)
          .bold()
        
        Image(systemName: "checkmark.seal.fill")
          .foregroundColor(Color(.systemBlue))
      }
      
      Text("@\(viewModel.user.username)")
        .font(.subheadline)
        .foregroundColor(.gray)
      
    }
    .padding(.horizontal)
  }
  
  private var tweetFolterBar: some View {
    HStack {
      ForEach(TweetFilterViewModel.allCases, id: \.rawValue) { item in
        VStack {
          Text("\(item.title)")
            .font(.subheadline)
            .fontWeight(selectionFilter == item ? .semibold : .regular)
            .foregroundColor(selectionFilter == item ? .black : .gray)
          if selectionFilter == item {
            Capsule()
              .foregroundColor(Color(.systemBlue))
              .frame(height: 3)
              .matchedGeometryEffect(id: "filter", in: animation)
          } else {
            Capsule()
              .foregroundColor(Color(.clear))
              .frame(height: 3)
          }
        }
        .onTapGesture {
          withAnimation(.easeInOut) {
            self.selectionFilter = item
          }
        }
      }
    }
  }
  
  private var tweetsView: some View {
    ScrollView {
      LazyVStack {
        ForEach(viewModel.tweets(forFilter: self.selectionFilter)) { tweet in
          TweetRowView(tweet: tweet)
            .padding()
        }
      }
    }
  }
}
