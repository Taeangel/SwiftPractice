//
//  CoinsProvider.swift
//  TCAProject
//
//  Created by song on 2022/12/06.
//

import Foundation
import Combine

extension Provider {
  func getCoins() -> AnyPublisher<[CoinModel], CoinError> {
   let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h")
    
    var request = URLRequest(url: url!)
    request.httpMethod = "GET"

    return requestPublisher(request)
  }
}
