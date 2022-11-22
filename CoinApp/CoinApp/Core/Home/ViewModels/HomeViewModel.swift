//
//  HomeViewModel.swift
//  CoinApp
//
//  Created by song on 2022/11/18.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
  @Published var allCoins: [CoinModel] = []
  @Published var portfolioCoins: [CoinModel] = []
  
  @Published var searchText: String = ""
  
  private let dataService = CoinDataService()
  private var cancellalbes = Set<AnyCancellable>()
  
  init() {
    addSubscribers()
  }
  
  func addSubscribers() {
    
    $searchText
      .combineLatest(dataService.$allCoins)
      .map(filterCoins)
      .sink { [weak self] returnedCoins in
        self?.allCoins = returnedCoins
      }
      .store(in: &cancellalbes)
  }
                			
  private func filterCoins(text: String, coins: [CoinModel]) -> [CoinModel] {
    guard !text.isEmpty else {
      return coins
    }
      
    let lowercasedText = text.lowercased() // 대소문자 비교가 불가하기떄문에 다 소문자로 만듬
                              
    let filteredCoins = coins.filter { coin -> Bool in
      return coin.name.lowercased().contains(lowercasedText) ||
             coin.symbol.lowercased().contains(lowercasedText) ||
             coin.id.lowercased().contains(lowercasedText)
    }
    
    return filteredCoins
  }
}
