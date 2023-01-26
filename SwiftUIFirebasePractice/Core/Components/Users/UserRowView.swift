//
//  UserRowView.swift
//  SwiftUIFirebasePractice
//
//  Created by song on 2023/01/25.
//

import SwiftUI

struct UserRowView: View {
  var body: some View {
    HStack {
      Circle()
        .frame(width: 48, height: 48)
      
      VStack(alignment: .leading, spacing: 4) {
        Text("jocker")
          .font(.subheadline)
          .bold()
          .foregroundColor(.black)
        
        Text("Heath Lefger")
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
    UserRowView()
  }
}
