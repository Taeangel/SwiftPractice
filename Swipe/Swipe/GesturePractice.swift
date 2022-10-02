//
//  DragGestureView.swift
//  CalendarPractice
//
//  Created by song on 2022/10/02.
//

import SwiftUI

struct DragGestureView: View {
  @State var startingOffsetY: CGFloat = UIScreen.main.bounds.height * 0.85
  @State var currentOffsety: CGFloat = 0
  @State var endingOffsety: CGFloat = 0

  var body: some View {
    
    ZStack {
      Color.green.ignoresSafeArea()
      
      MySignView()
        .offset(y: startingOffsetY)
        .offset(y: currentOffsety)
        .offset(y: endingOffsety)
        .gesture(
          DragGesture()
            .onChanged({ value in
              withAnimation(.spring()) {
                currentOffsety = value.translation.height
              }
            })
            .onEnded({ value in
              
              if currentOffsety < -150 {
                endingOffsety = -startingOffsetY
              } else if endingOffsety != 0 && currentOffsety > 150  {
                endingOffsety = 0
              }
              currentOffsety = 0
            })
        )
      Text("\(currentOffsety)")
    }
    .ignoresSafeArea(edges: .bottom)
  }
}

struct DragGestureView_Previews: PreviewProvider {
  static var previews: some View {
    DragGestureView()
  }
}

struct MySignView: View {
  var body: some View {
    VStack {
      Image(systemName: "chevron.up")
        .padding(3)
      
      Text("Sign up")
        .padding(.bottom)
    
      Text("CREATE AN ACCOUNT")
        .foregroundColor(.white)
        .font(.headline)
        .padding()
        .padding(.horizontal)
        .background(Color.black.cornerRadius(10))
      
      Spacer()
    }
    .padding(.top)
    .frame(maxWidth: .infinity)
    .background(Color.white)
    .cornerRadius(30)
  }
}
