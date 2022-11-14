//
//  HomeView.swift
//  SwiftUICryptoApp
//
//  Created by song on 2022/11/09.
//

import SwiftUI

struct HomeView: View {
  @EnvironmentObject private var vm: HomeViewModel
  @State private var showPortfolio: Bool = false
  
  var body: some View {
    ZStack {
      Color.theme.background
        .ignoresSafeArea()
      
      VStack {
        homeHeader
        
        columnTitles
        
        if !showPortfolio {
          allCoinsList
            .transition(.move(edge: .leading))
        }
        
        if showPortfolio {
          portfolitCoinsList
            .transition(.move(edge: .trailing))
        }
        
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
//        .preferredColorScheme(.dark)
    }
    .environmentObject(dev.homeVM)
  }
}


extension HomeView {
  private var homeHeader: some View {
    HStack {
      CircleButtonView(iconeName: showPortfolio ? "plus" : "info")
        .animation(.none)
        .background(
          CircleButtonAnimationView(animate: $showPortfolio)
        )
      Spacer()
      Text(showPortfolio ? "Portfolio" : "Live Proces" )
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
  
  private var allCoinsList: some View {
    List {
      ForEach(vm.allCoins) { coin in
        CoinRowView(coin: coin, showHoldingsColumn: false)
          .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
      }
    }
    .listStyle(PlainListStyle())
  }
  
  private var portfolitCoinsList: some View {
    List {
      ForEach(vm.portfolioCoins) { coin in
        CoinRowView(coin: coin, showHoldingsColumn: true)
          .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
      }
    }
    .listStyle(PlainListStyle())
  }
  
  private var columnTitles: some View {
    
    HStack {
      Text("Coin")
      Spacer()
      if showPortfolio {
        Text("Holdings")
      }
     
      Text("Price")
        .frame(width: UIScreen.main.bounds.width / 3, alignment: .trailing)
    }
    .font(.caption)
    .foregroundColor(Color.theme.secondaryText)
    .padding(.horizontal)
  }
}
