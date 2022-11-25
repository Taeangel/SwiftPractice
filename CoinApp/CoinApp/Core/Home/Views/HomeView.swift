//
//  HomeView.swift
//  CoinApp
//
//  Created by song on 2022/11/18.
//

import SwiftUI

struct HomeView: View {
  @EnvironmentObject private var vm: HomeViewModel
  @State private var showPortfolio: Bool = false // animate right
  @State private var showPortfolioView: Bool = false //new sheet
  
  var body: some View {
    ZStack {
      Color.theme.background
        .ignoresSafeArea()
        .sheet(isPresented: $showPortfolioView) {
          PortfolioView()
            .environmentObject(vm)
        }
      
      VStack {
        
        homeHeader
        
        HomeStatsVieiw(showPortfolio: $showPortfolio)
        
        SearchBarView(seachText: $vm.searchText)
        
        columnTitles
        
        if !showPortfolio {
          allCoinsList
            .transition(.move(edge: .leading))
        }
        
        if showPortfolio {
          portfolioCoinsList
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
        .toolbar(.hidden)
    }
    .environmentObject(dev.homeVM)
  }
}

extension HomeView {
  private var homeHeader: some View {
    HStack {
      CircleButtonView(iconeName: showPortfolio ? "plus" : "info")
         .onTapGesture {
          if showPortfolio {
            showPortfolioView.toggle()
          }
          
        }
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
  
  private var allCoinsList: some View {
    List {
      ForEach(vm.allCoins) { coin in
        CoinRowView(coin: coin, showHoldingColumn: false)
          .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
      }
    }
    .listStyle(PlainListStyle())
  }
  
  private var portfolioCoinsList: some View {
    List {
      ForEach(vm.portfolioCoins) { coin in
        CoinRowView(coin: coin, showHoldingColumn: true)
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
          .frame(width: UIScreen.main.bounds.width / 3.5,
                 alignment: .trailing)
      }
     
      Spacer()
      
      Text("Price")
    }
    .font(.caption)
    .foregroundColor(Color.theme.secondaryText)
    .padding(.horizontal)
  }
}
