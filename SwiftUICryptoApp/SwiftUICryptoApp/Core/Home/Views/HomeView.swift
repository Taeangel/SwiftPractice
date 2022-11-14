//
//  HomeView.swift
//  SwiftUICryptoApp
//
//  Created by song on 2022/11/09.
//

import SwiftUI

struct HomeView: View {
  @State private var shoewPortfolio: Bool = false
  
  var body: some View {
    ZStack {
      Color.theme.background
        .ignoresSafeArea()
      
      VStack {
        homeHeader
        
        Spacer(minLength: 0)
      }
    }
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      HomeView()
        .navigationBarHidden(true)
    }
  }
}


extension HomeView {
  private var homeHeader: some View {
    HStack {
      CircleButtonView(iconeName: shoewPortfolio ? "plus" : "info")
        .animation(.none)
        .background(
        CircleButtonAnimationView(animate: $shoewPortfolio)
        )
      Spacer()
      Text(shoewPortfolio ? "Portfolio" : "Live Proces" )
        .font(.headline)
        .fontWeight(.heavy)
        .foregroundColor(Color.theme.accent)
      Spacer()
      CircleButtonView(iconeName: "chevron.right")
        .rotationEffect(Angle(degrees: shoewPortfolio ? 180 : 0))
        .onTapGesture {
          withAnimation(.spring()) {
            shoewPortfolio.toggle()
          }
        }
    }
    .padding(.horizontal)
  }
}
