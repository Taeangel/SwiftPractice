//
//  ContentView.swift
//  UnitTestPractice
//
//  Created by song on 2022/10/09.
//

import SwiftUI


/*
 유닛테스트
 앱의 비즈니스 로직 테스트
*/

class UnitTesetingViewModel: ObservableObject {
  @Published var isPremium: Bool
  
  init(isPremium: Bool) {
    self.isPremium = isPremium
  }
}


struct ContentView: View {
  
  @StateObject private var vm: UnitTesetingViewModel
  
  init(isPremium: Bool) {
    _vm = StateObject(wrappedValue: UnitTesetingViewModel(isPremium: isPremium))
  }
  
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
