//
//  ContentView.swift
//  MVVMCombine
//
//  Created by song on 2022/11/04.
//

import SwiftUI
import Combine


enum PasswordStatus {
  case empty
  case notStrongEnough
  case repeatedPasswordWrong
  case valid
}

class FormViewModel: ObservableObject {
  @Published var username = ""
  @Published var password = ""
  @Published var passwordAgain = ""
  
  @Published var isValid = false
  
  @Published var inlineErrorForPassword = ""
  
  private static let predicate = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&]).{6,}$")
  
  private var cancellable = Set<AnyCancellable>()
  
  private var isUsernameVailidPublisher: AnyPublisher<Bool, Never> {
    $username
      .debounce(for: 0.5, scheduler: RunLoop.main)
      .removeDuplicates()
      .map { $0.count >= 3 }
      .eraseToAnyPublisher()
  }
  
  private var isPasswordEmptyPublisher: AnyPublisher<Bool, Never> {
    $password
      .debounce(for: 0.5, scheduler: RunLoop.main)
      .removeDuplicates()
      .map { $0.isEmpty }
      .eraseToAnyPublisher()
  }
  
  private var arePasswordEqualPublisher: AnyPublisher<Bool, Never> {
    Publishers.CombineLatest($password, $passwordAgain)
      .debounce(for: 0.2, scheduler: RunLoop.main)
      .map { $0 == $1 }
      .eraseToAnyPublisher()
  }
  
  private var isPasswordStrongPublisher: AnyPublisher<Bool, Never> {
    $password
      .debounce(for: 0.2, scheduler: RunLoop.main)
      .removeDuplicates()
      .map { Self.predicate.evaluate(with: $0) }
      .eraseToAnyPublisher()
  }
  
  private var isPasswordValidPublisher: AnyPublisher<PasswordStatus, Never> {
    Publishers.CombineLatest3(isPasswordEmptyPublisher, isPasswordStrongPublisher, arePasswordEqualPublisher)
      .map {
        if $0 { return PasswordStatus.empty }
        if !$1 { return PasswordStatus.notStrongEnough }
        if !$2 { return PasswordStatus.repeatedPasswordWrong }
        return PasswordStatus.valid
      }
      .eraseToAnyPublisher()
  }
  
  private var isFormValidPublisher: AnyPublisher<Bool, Never> {
    Publishers.CombineLatest(isPasswordValidPublisher, isUsernameVailidPublisher)
      .map { $0 == PasswordStatus.valid && $1 }
      .eraseToAnyPublisher()
  }
  
  init() {
    isFormValidPublisher
      .receive(on: RunLoop.main)
      .assign(to: \.isValid, on: self)
      .store(in: &cancellable)
    
    isPasswordValidPublisher // 처음에는 당연히 실패할것이기떄문
      .dropFirst()
      .receive(on: RunLoop.main)
      .map { passwordStatus in
        switch passwordStatus {
        case .empty:
          return "Password cannot be empty!"
        case .notStrongEnough:
          return "Password is too weak"
        case .repeatedPasswordWrong:
          return "Password do not match"
        case .valid:
          return ""
          
        }
      }
      .assign(to: \.inlineErrorForPassword , on: self)
      .store(in: &cancellable)
  }
}




struct ContentView: View {
  @StateObject var vm = FormViewModel()
  
  
  
  var body: some View {
    VStack {
      
      Form {
        Section(
          content: {
            TextField("UserName", text: $vm.username)
          },
          header: {
            Text("username".uppercased())
          })
        Section(
          content: {
            TextField("Password", text: $vm.password)
            TextField("Password", text: $vm.passwordAgain)
          },
          header: {
            Text("password".uppercased())
          },
          
          footer: {
            Text(vm.inlineErrorForPassword)
              .foregroundColor(.red)
          }
        )
        
      }
      Button(
        action: {
          
        },
        label: {
          RoundedRectangle(cornerRadius: 10)
            .frame(height: 60)
            .overlay {
              Text("Continue")
                .foregroundColor(.white)
            }
        })
      .padding()
      .disabled(!vm.isValid)
      
    }
    
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
