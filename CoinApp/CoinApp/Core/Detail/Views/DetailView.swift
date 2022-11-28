//
//  DetailView.swift
//  CoinApp
//
//  Created by song on 2022/11/28.
//

import SwiftUI

struct DetailLoadingView: View {
  @Binding var coin : CoinModel?
  
  var body: some View {
    ZStack {
      if let coin = coin {
        DetailView(coin: coin)
      }
    }
  }
}

struct DetailView: View {
  @StateObject var vm: DetailViewModel
  private let columns: [GridItem] = [
    GridItem(.flexible()),
    GridItem(.flexible()),
  ]
  
  init(coin: CoinModel) {
    self._vm = StateObject(wrappedValue: DetailViewModel(coin: coin))
  }
  
  var body: some View {
    ScrollView {
      VStack {
        Text("Hello")
          .frame(height: 150)
        
        Text("Overview")
          .font(.title)
          .bold()
          .foregroundColor(Color.theme.accent)
          .frame(maxWidth: .infinity, alignment: .leading)
        
        Divider()
        
        LazyVGrid(columns: columns,
                  alignment: .center,
                  spacing: 30,
                  pinnedViews: [],
                  content: {
          ForEach(vm.overviewStatistics) { stat in
            StatisticView(stat: stat)
          }
        })

        Text("Additional Details")
          .font(.title)
          .bold()
          .foregroundColor(Color.theme.accent)
          .frame(maxWidth: .infinity, alignment: .leading)
        
        Divider()
        
        LazyVGrid(columns: columns,
                  alignment: .center,
                  spacing: 30,
                  pinnedViews: [],
                  content: {
          ForEach(vm.additionalStatistics) { stat in
            StatisticView(stat: stat)
          }
        })
      }
      .padding()
    }
    .navigationTitle(vm.coin.name)
  }
}

struct DetailView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      DetailView(coin: dev.coin)
    }
  }
}
