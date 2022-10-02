//
//  ContentView.swift
//  Swipe
//
//  Created by song on 2022/10/02.
//

import SwiftUI

struct ContentView: View {
  
  @State var offset: CGSize = .zero
  
  var body: some View {
    RoundedRectangle(cornerRadius: 20)
      .frame(width: 100, height: 100)
      .gesture(
        DragGesture()
          .onChanged({ value in
            
          })
          .onEnded({ value in
            
          })
      )
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
