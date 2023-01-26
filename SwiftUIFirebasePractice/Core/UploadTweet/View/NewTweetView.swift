//
//  NewTweetView.swift
//  SwiftUIFirebasePractice
//
//  Created by song on 2023/01/26.
//

import SwiftUI

struct NewTweetView: View {
  @State private var caption = ""
  @Environment(\.presentationMode) var presentationMode
  var body: some View {
    VStack {
      HStack {
        Button(action: {
          presentationMode.wrappedValue.dismiss()
        },
               label: {
          Text("Cancel")
            .foregroundColor(Color(.systemBlue))
        })
        
        Spacer()
        
        Button(action: {
          
        },
               label: {
          Text("Tweet")
            .padding(.horizontal)
            .padding(.vertical, 8)
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Capsule())
        })
      }
      .padding(.horizontal)
      
      HStack(alignment: .top) {
        Circle()
          .frame(width: 64, height: 64)
        TextArea("what happening", text: $caption)
      }
      .padding()
    }
  }
}

struct NewTweetView_Previews: PreviewProvider {
  static var previews: some View {
    NewTweetView()
  }
}
