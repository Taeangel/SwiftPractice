//
//  ContentView.swift
//  키보드
//
//  Created by song on 2023/04/25.
//

import SwiftUI

struct ContentView: View {
  
  @State var nameInput: String = ""
  @State var emailInput: String = ""
  @State var passwordInput: String = ""
  @State var passwordConfirmInput: String = ""
  
  var body: some View{
    
    VStack(alignment: .leading) {
      
      VStack(alignment: .leading) {
        Text("이름")
        TextField("이름을 입력해주세요", text: $nameInput).keyboardType(.default).autocapitalization(.none)
      }
      .padding()
      
      
      VStack(alignment: .leading) {
        Text("이메일")
        TextField("이메일", text: $emailInput).keyboardType(.emailAddress).autocapitalization(.none)
      }
      
      VStack(alignment: .leading) {
        Text("비밀번호")
        SecureField("비밀번호", text: $passwordInput).keyboardType(.default)
        SecureField("비밀번호 확인", text: $passwordConfirmInput).keyboardType(.default)
      }
      
      VStack(alignment: .leading) {
        Text("이름")
        TextField("이름을 입력해주세요", text: $nameInput).keyboardType(.default).autocapitalization(.none)
      }
       
       
        Section{
          Button {
            print("회원가입 버튼 클릭")
          } label: {
            Text("회원가입하기")
          }
        }
      
    }
    .navigationTitle("회원가입")
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      ContentView()
    }
  }
}
