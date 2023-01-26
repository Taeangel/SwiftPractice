//
//  UserStatsView.swift
//  SwiftUIFirebasePractice
//
//  Created by song on 2023/01/26.
//

import SwiftUI

struct UserStatsView: View {
  var body: some View {
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
}

struct UserStatsView_Previews: PreviewProvider {
  static var previews: some View {
    UserStatsView()
  }
}
