//
//  ContentView.swift
//  AlamofirePractirce
//
//  Created by song on 2022/11/05.
//

import SwiftUI

struct ContentView: View {
  @StateObject var vm = RandomUserViewModel()
  
  let url = URL(string: "https://randomuser.me/api/portraits/women/91.jpg")!
  var body: some View {
    ScrollView {
      ForEach(vm.randomUsers) { randomUser in
        RandomUserView(randomUser)
      }
    }
    .padding()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
