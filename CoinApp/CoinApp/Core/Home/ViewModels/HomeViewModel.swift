//
//  HomeViewModel.swift
//  CoinApp
//
//  Created by song on 2022/11/18.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
  
  @Published var statistics: [StatisticModel] = []
  @Published var allCoins: [CoinModel] = []
  @Published var portfolioCoins: [CoinModel] = []
  @Published var searchText: String = ""
  
  private let coinDataService = CoinDataService()
  private let marketDataService = MarketDataService()
  private var cancellalbes = Set<AnyCancellable>()
  private let portfolioDataService = PortfolioDataService()
  
  init() {
    addSubscribers()
  }
  
  func addSubscribers() {
    // updata allCoins
    $searchText
      .combineLatest(coinDataService.$allCoins)
      .map(filterCoins)
      .sink { [weak self] returnedCoins in
        self?.allCoins = returnedCoins
      }
      .store(in: &cancellalbes)
    
    // updates marketData
    marketDataService.$marketData
      .map(mapGlobalMarketData)
      .sink { [weak self] stats in
        self?.statistics = stats
      }
      .store(in: &cancellalbes)
    
    // updates portfolioCoins
    $allCoins
      .combineLatest(portfolioDataService.$saveEntities)
      .map { (coinModels, portfolioEntities) -> [CoinModel] in
        coinModels
          .compactMap { coin -> CoinModel? in
            guard let entity = portfolioEntities.first(where: { $0.coinID == coin.id }) else {
              return nil
            }
            return coin.updateHoldings(amount: entity.amount)
          }
      }
      .sink { [weak self] returnedCoins in
        self?.portfolioCoins = returnedCoins
      }
      .store(in: &cancellalbes)
    
  }
  
  func updatePortfolio(coin: CoinModel, amount: Double) {
    portfolioDataService.updatePortfolio(coin: coin, amount: amount)
  }
  
  private func filterCoins(text: String, coins: [CoinModel]) -> [CoinModel] {
    guard !text.isEmpty else {
      return coins
    }
    
    let lowercasedText = text.lowercased() 
    
    let filteredCoins = coins.filter { coin -> Bool in
      return coin.name.lowercased().contains(lowercasedText) ||
      coin.symbol.lowercased().contains(lowercasedText) ||
      coin.id.lowercased().contains(lowercasedText)
    }
    
    return filteredCoins
  }
  
  private func mapGlobalMarketData(data: MarketDataModel?) -> [StatisticModel] {
    var stats: [StatisticModel] = []
    
    guard let data = data else {
      return stats
    }
    
    let marketCap = StatisticModel(title: "Market Cap",
                                   value: data.marketCap,
                                   percentageChaange: data.marketCapChangePercentage24HUsd)
    
    let volume = StatisticModel(title: "24h Volume",
                                value: data.volum)
    
    let btcDominance = StatisticModel(title: "BTC Dominance",
                                      value: data.btcDominance)
    
    let portfolio = StatisticModel(title: "Portfolio",
                                   value: "$0.00",
                                   percentageChaange: 0)
    
    stats.append(contentsOf: [marketCap, volume, btcDominance, portfolio])
    
    return stats
  }
}
