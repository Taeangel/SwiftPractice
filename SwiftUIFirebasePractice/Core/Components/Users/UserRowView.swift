//
//  UserRowView.swift
//  SwiftUIFirebasePractice
//
//  Created by song on 2023/01/25.
//

import SwiftUI
import Kingfisher

struct UserRowView: View {
  let user: TwitterUser
  
  var body: some View {
    HStack {
      KFImage(URL(string: user.profileImageUrl))
        .resizable()
        .scaledToFill()
        .clipShape(Circle())
        .frame(width: 48, height: 48)
      
      VStack(alignment: .leading, spacing: 4) {
        Text(user.username)
          .font(.subheadline)
          .bold()
          .foregroundColor(.black)
        
        Text(user.fullname)
          .font(.subheadline)
          .foregroundColor(.gray)
      }
      
      Spacer()
    }
    .padding(.horizontal)
    .padding(.vertical, 4)
  }
}

struct UserRowView_Previews: PreviewProvider {
  static var previews: some View {
    UserRowView(user: TwitterUser(username: "asd", fullname: "asdf", profileImageUrl: "", email: "asdfzxvc"))
  }
}
