//
//  CoinLogoView.swift
//  CoinApp
//
//  Created by song on 2022/11/24.
//

import SwiftUI

struct CoinLogoView: View {

  let coin: CoinModel
  
  var body: some View {
    
    VStack {
      CoinImageView(coin: coin)
        .frame(width: 50, height: 50)
      
      Text(coin.symbol.uppercased())
        .font(.headline)
        .foregroundColor(Color.theme.accent)
        .lineLimit(1)
        .minimumScaleFactor(0.5)
      Text(coin.name)
        .font(.caption)
        .foregroundColor(Color.theme.secondaryText)
        .minimumScaleFactor(0.5)
        .multilineTextAlignment(.center)
    }
  }
}

struct CoinLogoView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      CoinLogoView(coin: dev.coin)
      
      CoinLogoView(coin: dev.coin)
        .preferredColorScheme(.dark)
    }
  }
}
