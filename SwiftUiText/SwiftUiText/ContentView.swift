//
//  ContentView.swift
//  SwiftUiText
//
//  Created by song on 2022/09/22.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    Text("Hello, world!")
      .italic() // 기울임
      .strikethrough(true, color: Color.red) //취소선
      .font(.system(size: 30, weight: .semibold, design: .rounded))// 이런 폰트 디자인도 있다
      .multilineTextAlignment(.center)// 이런 여러줄 정렬방식도 있다.
    
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
