//
//  HomeView.swift
//  CoinApp
//
//  Created by song on 2022/11/18.
//

import SwiftUI

struct HomeView: View {
  
  @State private var showPortfolio: Bool = false
  
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
        .toolbar(.hidden)
    }
  }
}

extension HomeView {
  private var homeHeader: some View {
    HStack {
      CircleButtonView(iconeName: showPortfolio ? "plus" : "info")
        .background(
          CircleButtonAnimationView(animate: $showPortfolio)
        )
      Spacer()
      Text(showPortfolio ? "Portfolio" : "Live Prices")
        .font(.headline)
        .fontWeight(.heavy)
        .foregroundColor(Color.theme.accent)
      Spacer()
      CircleButtonView(iconeName: "chevron.right")
        .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
        .onTapGesture {
          withAnimation(.spring()) {
            showPortfolio.toggle()
          }
        }
    }
    .padding(.horizontal)
  }
}
