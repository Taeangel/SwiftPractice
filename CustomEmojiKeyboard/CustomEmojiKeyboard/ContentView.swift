//
//  ContentView.swift
//  CustomEmojiKeyboard
//
//  Created by song on 2022/10/29.
//

import SwiftUI

struct ContentView: View {
  @State var txt = ""
  @State var show = false
    
  var body: some View {
    ZStack(alignment: .bottom) {
      GeometryReader { _ in
        
        VStack {
          HStack(spacing: 15) {
            TextField("Message", text: self.$txt)
          }
          .padding(12)
          .background(Color.white)
          .clipShape(Capsule() )
          
          EmojiView(txt: $txt)
        }
      }
    }
    .background(Color("Color").edgesIgnoringSafeArea(.all))
  }
}

struct EmojiView: View {
  @Binding var txt: String
  
  var body: some View {
    ZStack(alignment: .topLeading) {
      ScrollView(.vertical, showsIndicators: false) {
        VStack(spacing: 15) {
          ForEach(self.getEmojiList(), id: \.self) { i in
            HStack(spacing: 25) {
              ForEach(i, id: \.self) { j in
                Button(action: {
                  guard let unicode = UnicodeScalar(j) else {
                    return
                  }
                  self.txt = String(unicode)
                },
                       label: {
                  if UnicodeScalar(j)?.properties.isEmoji != nil, let unicode = UnicodeScalar(j) {
                    Text(String(unicode))
                      .font(.system(size: 20))
                  } else {
                    Text("")
                  }
                })
              }
            }
          }
        }
        .padding(.top)
      }
      .frame(width: UIScreen.main.bounds.width / 4 * 3, height: UIScreen.main.bounds.height/3)
      .background(Color.white)
      .cornerRadius(25)
    }
  }
  
  func getEmojiList() -> [[Int]] {
    var emoji: [[Int]] = []
    
    for i in stride(from: 0x1F601, to: 0x1F64F, by: 4)  {
      var temp: [Int] = []
      
      for j in i...i+6 {
        temp.append(j)
        
      }
      emoji.append(temp)
    }
    return emoji
  }
}
