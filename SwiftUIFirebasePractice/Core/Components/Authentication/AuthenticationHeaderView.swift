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
      Text(title1)
        .font(.largeTitle)
        .fontWeight(.semibold)
      
      Text(title2)
        .font(.largeTitle)
        .fontWeight(.semibold)
    }
    .frame(height: 260)
    .padding(.leading)
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
