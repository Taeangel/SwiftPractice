//
//  LoginView.swift
//  SwiftUIFirebasePractice
//
//  Created by song on 2023/01/26.
//

import SwiftUI

struct LoginView: View {
  @State private var email = ""
  @State private var password = ""
  var body: some View {
    VStack {
      // header view
      AuthenticationHeaderView(title1: "Hello.", title2: "WelcomeBack")
      
      VStack(spacing: 40) {
        CustomInputField(imageName: "envelope",
                         placeholderText: "Email",
                         text: $email)
        
        CustomInputField(imageName: "lock",
                         placeholderText: "password",
                         text: $password)
      }
      .padding(.horizontal, 32)
      .padding(.top, 44)
      
      HStack {
        Spacer()
        
        NavigationLink {
          Text("Reset password view..")
        } label: {
          Text("Forgot Password")
            .font(.caption)
            .fontWeight(.bold)
            .foregroundColor(Color(.systemBlue))
            .padding(.top)
            .padding(.trailing, 24)
        }
      }
      
      Button {
        print("sign")
      } label: {
        Text("Sign In")
          .font(.headline)
          .foregroundColor(.white)
          .frame(width: 340, height: 50)
          .background(Color(.systemBlue))
          .clipShape(Capsule())
          .padding()
      }
      .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
      
      Spacer()
      
      NavigationLink {
        RegistrationView()
          .navigationBarHidden(true)
      } label: {
        Text("Dont have an account?")
          .font(.footnote)
        
        Text("Sign up")
          .font(.footnote)
          .fontWeight(.semibold)
      }
      .padding(.bottom, 32)
      .foregroundColor(Color(.systemBlue))
    }
    .ignoresSafeArea()
  }
}

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView()
  }
}
