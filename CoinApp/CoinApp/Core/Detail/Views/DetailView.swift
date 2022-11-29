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
  @State private var showFullDescription: Bool = false
  
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
        ChartView(coin: vm.coin)
          .padding(.vertical , 10)
        
        overviewTitle
        
        Divider()
        
        descriptionSection
        
        overviewStatistics
        
        additionalTitle
        
        Divider()
        
        additionalStatistics
        
        webSiteSection
      }
      
      .padding()
    }
    .navigationTitle(vm.coin.name)
    .toolbar {
      ToolbarItem(placement: .navigationBarTrailing) {
        navigationBarTrailingItems
      }
    }
  }
}

struct DetailView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      DetailView(coin: dev.coin)
    }
  }
}

extension DetailView {
  
  private var overviewTitle: some View {
    Text("Overview")
      .font(.title)
      .bold()
      .foregroundColor(Color.theme.accent)
      .frame(maxWidth: .infinity, alignment: .leading)
  }
  
  private var overviewStatistics: some View {
    LazyVGrid(columns: columns,
              alignment: .center,
              spacing: 30,
              pinnedViews: [],
              content: {
      ForEach(vm.overviewStatistics) { stat in
        StatisticView(stat: stat)
      }
      .frame(maxWidth: .infinity, alignment: .leading)
    })
    
  }
  
  private var additionalTitle: some View {
    Text("Additional Details")
      .font(.title)
      .bold()
      .foregroundColor(Color.theme.accent)
      .frame(maxWidth: .infinity, alignment: .leading)
  }
  
  private var additionalStatistics: some View {
    LazyVGrid(columns: columns,
              alignment: .center,
              spacing: 30,
              pinnedViews: [],
              content: {
      ForEach(vm.additionalStatistics) { stat in
        StatisticView(stat: stat)
      }
      .frame(maxWidth: .infinity, alignment: .leading)
    })
  }
  
  private var navigationBarTrailingItems: some View {
    HStack {
      Text(vm.coin.symbol.uppercased())
        .font(.headline)
        .foregroundColor(Color.theme.secondaryText)
      CoinImageView(coin: vm.coin)
        .frame(width: 25, height: 25)
    }
  }
  
  private var webSiteSection: some View {
    VStack(alignment: .leading, spacing: 101) {
      if let websiteString = vm.websiteURL, let url = URL(string: websiteString) {
        Link("Website", destination: url)
      }
      
      if let redditString = vm.redditURL,
         let url = URL(string: redditString) {
        Link("Reddit", destination: url)
      }
    }
    .tint(.blue)
    .frame(maxWidth: .infinity, alignment: .leading)
    .font(.headline)
  }
  
  private var descriptionSection: some View {
    ZStack {
      if let coinDescription = vm.coinDescription, !coinDescription.isEmpty {
        VStack(alignment: .leading) {
          Text(coinDescription)
            .lineLimit(showFullDescription ? nil : 3)
            .font(.callout)
            .foregroundColor(Color.theme.secondaryText)
          
          Button(action: {
            withAnimation(.linear(duration: 0.3)) {
              showFullDescription.toggle()
            }
          },
                 label: {
            Text(showFullDescription ? "Less" : "Read more..")
              .font(.caption)
              .fontWeight(.bold)
              .padding(.vertical, 4)
          })
          .tint(.blue)
        }
      }
    }
  }
}
