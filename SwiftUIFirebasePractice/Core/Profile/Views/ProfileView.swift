//
//  ProfileView.swift
//  SwiftUIFirebasePractice
//
//  Created by song on 2023/01/24.
//

import SwiftUI

struct ProfileView: View {
  @State private var selectionFilter: TweetFilterViewModel = .tweets
  @Namespace var animation
  
  var body: some View {
    VStack(alignment: .leading) {
      
      hearderView
      
      actionButtons
      
      userInfoDetails
      
      tweetFolterBar
      
      tweetsView
      
      Spacer()
    }
  }
}

struct ProfileView_Previews: PreviewProvider {
  static var previews: some View {
    ProfileView()
  }
}


extension ProfileView {
  private var hearderView: some View {

    ZStack(alignment: .bottomLeading) {
      
      Color(.systemBlue)
        .ignoresSafeArea()
      VStack {
        Button(
          action: {
          
        },
          label: {
          Image(systemName: "arrow.left")
            .resizable()
            .frame(width: 20, height: 16)
            .foregroundColor(.white)
            .offset(x: 16, y: 12)
        })
      
      Circle()
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
        Text("Heath Ledger")
          .font(.title2)
          .bold()
        
        Image(systemName: "checkmark.seal.fill")
          .foregroundColor(Color(.systemBlue))
      }
      
      Text("@joker")
        .font(.subheadline)
        .foregroundColor(.gray)
      
      Text("Your moms favorite viliain")
        .font(.subheadline)
        .padding(.vertical)
      
      
      HStack(spacing: 24) {
        HStack {
          Image(systemName: "mappin.and.ellipse")
          
          Text("gatham, NY")
        }
        
        HStack {
          Image(systemName: "link")
          
          Text("www.thejoker.com")
        }
      }
      .font(.caption)
      .foregroundColor(.gray)
      
      
      HStack(spacing: 24) {
        HStack {
          Text("807")
            .font(.subheadline)
            .bold()
          
          Text("Following")
            .font(.caption)
            .foregroundColor(.gray)
        }
        
        HStack(spacing: 4) {
          Text("6.9M")
            .font(.subheadline)
            .bold()
          
          Text("Following")
            .font(.caption)
            .foregroundColor(.gray)
        }
      }
      .padding(.vertical)
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
        ForEach(0...9, id: \.self) { _ in
          TweetRowView()
            .padding()
        }
      }
    }
  }
}
