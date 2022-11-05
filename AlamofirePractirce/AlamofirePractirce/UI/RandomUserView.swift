//
//  RandomUserView.swift
//  AlamofirePractirce
//
//  Created by song on 2022/11/05.
//

import SwiftUI

struct RandomUserView: View {
  
  var randomUser: RandomUser
  
  init(_ randomUser: RandomUser) {
    self.randomUser = randomUser
  }
  var body: some View {
    HStack {
      
      ProfileImageView(imageUrl: randomUser.profileImageUrl)
      Text(randomUser.description)
        .fontWeight(.heavy)
        .font(.system(size: 25))
        .minimumScaleFactor(0.5)
        .lineLimit(2)
    }
    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50, alignment: .leading)
    .padding(.vertical, 5)
    .background(Color.gray)
  }
}

struct RandomUserView_Previews: PreviewProvider {
  static var previews: some View {
    RandomUserView(RandomUser.getDummy())
  }
}
