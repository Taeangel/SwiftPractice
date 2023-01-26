//
//  CustomInputField.swift
//  SwiftUIFirebasePractice
//
//  Created by song on 2023/01/26.
//

import SwiftUI

struct CustomInputField: View {
  let imageName: String
  let placeholderText: String
  var isSecureField: Bool = false
  @Binding var text: String

  var body: some View {
    VStack {
      HStack {
        Image(systemName: imageName)
          .resizable()
          .scaledToFit()
          .frame(width: 20, height: 20)
          .foregroundColor(Color(.darkGray))
        
        if isSecureField {
          SecureField(placeholderText, text: $text)
        } else {
          TextField(placeholderText, text: $text)
        }
      }
      
      Divider()
        .background(Color(.darkGray))
    }
  }
}

struct CustomInputField_Previews: PreviewProvider {
  static var previews: some View {
    CustomInputField(imageName: "enveloper",
                     placeholderText: "Email",
                     isSecureField: false,
                     text: .constant(""))
  }
}
