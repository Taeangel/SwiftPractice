//
//  ContentView.swift
//  AppStorage
//
//  Created by song on 2022/11/02.
//

import SwiftUI

struct ContentView: View {

  @State var currentUserName: String?
  
  var body: some View {
    VStack(spacing: 20) {
      Text(currentUserName ?? "Add Name Here")
      
      if let name = currentUserName {
        Text(name)
      }
      
      Button("Save".uppercased()) {
        let name = "Song"
        currentUserName = name
         
      }
    }
    .onAppear {
      currentUserName = UserDefaults.standard.string(forKey: "key")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
