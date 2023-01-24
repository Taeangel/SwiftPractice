//
//  CoinsClient.swift
//  TCAProject
//
//  Created by song on 2022/12/06.
//

import ComposableArchitecture

struct CoinsClient {
  var getCoins: () -> Effect<[CoinModel], CoinError>
}

extension CoinsClient: DependencyKey {
  static let liveValue = CoinsClient(getCoins: {
   let sadf =  Provider.shared.getCoins()
      .eraseToEffect()
  })
}

extension DependencyValues {
  var coinsClient: CoinsClient {
    get {self[CoinsClient.self] }
    set { self[CoinsClient.self] = newValue }
  }
}
