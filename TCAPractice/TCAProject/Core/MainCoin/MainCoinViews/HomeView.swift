//
//  ContentView.swift
//  TCAProject
//
//  Created by song on 2022/12/02.
//
import SwiftUI
import ComposableArchitecture

struct HomeView: View {
  
  private let store: StoreOf<MainCoinReducer>
  @ObservedObject var viewStore: ViewStoreOf<MainCoinReducer>
  
  init(store: StoreOf<MainCoinReducer>) {
    self.store = store
    viewStore = ViewStore(store)
  }
  
  var body: some View {
    VStack {
      homeHeaderView
    }
    .onAppear {
      viewStore.send(.onAppear)
    }
  }
}

extension HomeView {
  var homeHeaderView: some View {
    HStack {
      CircleButtonView(iconeName: viewStore.showPortfolio ? "plus" : "info")
        .background {
          CircleButtonAnimationView(animate: viewStore.binding(get: \.showPortfolio, send: .bindShowPortfolio))
        }
      
      Spacer()
      
      Text(viewStore.showPortfolio ? "Portfolio" : "Live Prices")
        .font(.headline)
        .fontWeight(.heavy)
        .foregroundColor(Color.theme.accent)
      
      Spacer()
      
      CircleButtonView(iconeName: "chevron.right")
        .rotationEffect(Angle(degrees: viewStore.showPortfolio ? 180 : 0))
        .onTapGesture {
          self.viewStore.send(.showPortfolioToggle, animation: .spring())
        }
    }
  }
}


