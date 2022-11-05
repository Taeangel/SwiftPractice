//
//  ProfileImageView.swift
//  AlamofirePractirce
//
//  Created by song on 2022/11/05.
//

import Foundation
import SwiftUI
import URLImage

struct ProfileImageView: View {
  
  var imageUrl: URL
  
  var body: some View {
    URLImage(imageUrl) { image, _ in
      image
        .resizable()
        .aspectRatio(contentMode: .fit)
    }
    .clipShape(Circle())
    .overlay(Circle().stroke(Color.red, lineWidth: 2))
  }
}
