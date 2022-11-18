//
//  CoinImageService.swift
//  CoinApp
//
//  Created by song on 2022/11/19.
//

import Foundation
import Combine
import SwiftUI

class CoinImageService {
  
  @Published var image: UIImage? = nil
  
  private var coinSubscription: AnyCancellable?
  private var coin: CoinModel
  
  init(coin: CoinModel) {
    self.coin = coin
    getCoinImage()
  }
  
  private func getCoinImage() {
    guard let url = URL(string: coin.image) else { return }
    
    coinSubscription = NetworkingManager.download(url: url)
      .tryMap({ data -> UIImage? in
        return UIImage(data: data)
      })
      .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedImage) in
        self?.image = returnedImage
        self?.coinSubscription?.cancel()
      })
  }
}
