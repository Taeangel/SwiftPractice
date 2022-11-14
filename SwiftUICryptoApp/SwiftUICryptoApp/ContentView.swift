//
//  ContentView.swift
//  SwiftUICryptoApp
//
//  Created by song on 2022/11/09.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    ZStack {
      Color.theme.background
        .ignoresSafeArea()
      VStack {
        Text("Accent Color")
          .foregroundColor(Color.theme.accent)
        
        Text("Secondary Text Color")
          .foregroundColor(Color.theme.secondaryText)
        
        Text("Red Text Color")
          .foregroundColor(Color.theme.red)
        
        Text("Green Text Color")
          .foregroundColor(Color.theme.green)
      }
      
    }
    
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
