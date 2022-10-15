//
//  OnboardingView.swift
//  CoordinatorPatternPractice
//
//  Created by song on 2022/10/14.
//

import SwiftUI

struct OnboardingView: View {
  var tapButton: () -> ()
    var body: some View {
      TabView {
        Image("강아지")
          .resizable()
          .scaledToFit()
          .tag(0)
        
        Image("자는강아지")
          .resizable()
          .scaledToFit()
          .tag(1)
        Button("Done") {
          tapButton()
        }
      }
      .tabViewStyle(PageTabViewStyle())
      .background(.black)
      .ignoresSafeArea(.all) 
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
      OnboardingView {
        
      }
    }
}
