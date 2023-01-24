//
//  CoinDetailDataService.swift
//  CoinApp
//
//  Created by song on 2022/11/28.
//

import Combine
import Foundation

class CoinDetailDataService {
  
  @Published var coinDetails: CoinDetailModel?
  var coinSubscription: AnyCancellable?
  let coin: CoinModel
  
  init(coin: CoinModel) {
    self.coin = coin
    getCoinDetail()
  }
  
  func getCoinDetail() {
    guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/\(coin.id)?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false") else { return }
    
    coinSubscription = NetworkingManager.download(url: url)
      .decode(type: CoinDetailModel.self, decoder: JSONDecoder())
      .receive(on: DispatchQueue.main)
      .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedCoinDetails in
        self?.coinDetails = returnedCoinDetails
        self?.coinSubscription?.cancel()
      })
  }
}
