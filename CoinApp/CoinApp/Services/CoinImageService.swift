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
  private let fileManager = LocalFileManager.instance
  private var folerName = "coin_images"
  private let imageName: String
  
  init(coin: CoinModel) {
    self.coin = coin
    self.imageName = coin.id
    getCoinImage()
  }
  
  private func getCoinImage() {
    if let savedImage = fileManager.getImage(imageName: coin.id, folderName: folerName) {
      image = savedImage
      print("retrieved file Image ")
    } else {
      downloadCoinImage()
      print("downloadImage")
    } 
  }
  
  
  private func downloadCoinImage() {
    guard let url = URL(string: coin.image) else { return }
    
    coinSubscription = NetworkingManager.download(url: url)
      .tryMap({ data -> UIImage? in
        return UIImage(data: data)
      })
      .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedImage in
        guard let self = self, let returnedImage = returnedImage else { return }
        self.image = returnedImage
        self.coinSubscription?.cancel()
        self.fileManager.saveImage(image: returnedImage, imageName: self.imageName, folderName: self.folerName)
      })
  }
}
