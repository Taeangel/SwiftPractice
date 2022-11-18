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
  
  private let dataService = CoinDataService()
  
  private var cancellalbes = Set<AnyCancellable>()
  
  init() {
    addSubscribers()
  }
  
  func addSubscribers() {
    
    dataService.$allCoins
      .sink { [weak self] (returnCoins) in
        self?.allCoins = returnCoins
      }
      .store(in: &cancellalbes)
  }
}
