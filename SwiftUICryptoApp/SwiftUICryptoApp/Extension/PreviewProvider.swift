//
//  PreviewProvider.swift
//  SwiftUICryptoApp
//
//  Created by song on 2022/11/10.
//

import Foundation
import SwiftUI

extension PreviewProvider {
  static var dev: DeveloperPreview {
    return DeveloperPreview.instance
  }
}


class DeveloperPreview {
  static let instance = DeveloperPreview()
  private init() {}
  
  let homeVM = HomeViewModel()
  
  let coin = CoinModel(id: "bitcoin",
                       symbol: "btc",
                       name: "Bitcoin",
                       image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
                       currentPrice: 16710.6,
                       marketCap: 321058711881,
                       marketCapRank: 1,
                       fullyDilutedValuation: 351097054438,
                       totalVolume: 79396826571,
                       high24H: 18749.92,
                       low24H: 15663.49,
                       priceChange24H: -1977.8296831891312,
                       priceChangePercentage24H: -10.58318,
                       marketCapChange24H: -35948248083.6214,
                       marketCapChangePercentage24H: -10.06934,
                       circulatingSupply: 19203331,
                       totalSupply: 21000000,
                       maxSupply: 21000000,
                       ath: 69045,
                       athChangePercentage: -75.77562,
                       athDate: "2021-11-10T14:24:11.849Z",
                       atl: 67.81,
                       atlChangePercentage: 24565.85146,
                       atlDate: "2013-07-06T00:00:00.000Z",
                       lastUpdated: "2022-11-10T06:04:55.098Z",
                       priceChangePercentage24HInCurrency: -10.583178709733925,
                       currentHoldings: 1.5)
}

