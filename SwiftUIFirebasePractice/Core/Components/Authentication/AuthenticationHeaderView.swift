//
//  AuthenticationHeaderView.swift
//  SwiftUIFirebasePractice
//
//  Created by song on 2023/01/26.
//

import SwiftUI

struct AuthenticationHeaderView: View {
  let title1: String
  let title2: String
  
  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        Spacer()
      }
      HStack(spacing: 30) {
        VStack {
          
          Text(title1)
            .font(.largeTitle)
            .fontWeight(.semibold)
          
          Text(title2)
            .font(.callout)
            .fontWeight(.semibold)
        }
        .padding(.leading)
        
        Spacer()
        
        Image("tweet")
          .resizable()
          .frame(width: 70, height: 70, alignment: .leading)
          .foregroundColor(.white)
      }
      .padding(20)
      
    }
    .frame(height: 200)
    .background(Color(.systemBlue))
    .foregroundColor(.white)
    .clipShape(RoundedShape(corners: [.bottomRight]))
    
    
  }
}

struct AuthenticationHeaderView_Previews: PreviewProvider {
  static var previews: some View {
    AuthenticationHeaderView(title1: "안녕", title2: "반가워")
  }
}
