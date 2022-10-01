//
//  ContentView.swift
//  Shape
//
//  Created by song on 2022/09/22.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    Circle()
//      .fill(Color.red)
//      .foregroundColor(.cyan)// 색체우는 방법은 여러가지
//      .stroke(Color.blue)//선만
      .stroke(Color.blue, lineWidth: 10) // 라인두께
    
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
