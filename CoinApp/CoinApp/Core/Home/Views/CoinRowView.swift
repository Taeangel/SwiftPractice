//
//  CoinRowView.swift
//  CoinApp
//
//  Created by song on 2022/11/18.
//

import SwiftUI

struct CoinRowView: View {
  
  let coin: CoinModel
  let showHoldingColumn: Bool
  
  var body: some View {
    
    HStack {
      
      leftColumn
      
      Spacer()
      
      if showHoldingColumn {
        centerCoumn
      }
      
      rightCoulmn
      
    }
    .font(.subheadline)
  }
}

struct CoinRowView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      CoinRowView(coin: dev.coin, showHoldingColumn: true)
        .previewLayout(.fixed(width: 200, height: 200))
      
      CoinRowView(coin: dev.coin, showHoldingColumn: false)
        .previewLayout(.sizeThatFits)
      CoinRowView(coin: dev.coin, showHoldingColumn: true)
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.dark)

    }
  }
}

extension CoinRowView {
  
  private var leftColumn: some View {
    HStack(spacing: 0) {
      Text("\(coin.rank)")
        .font(.caption)
        .foregroundColor(Color.theme.secondaryText)
        .frame(minWidth: 30)
      CoinImageView(coin: coin)
        .frame(width: 30, height: 30)
      Text(coin.symbol.uppercased())
        .font(.headline)
        .padding(.leading, 6)
        .foregroundColor(Color.theme.accent)
    }
  }
  
  private var centerCoumn: some View {
      VStack(alignment: .trailing) {
        Text(coin.currentHoldingsValue.asCurrencyWith2Decimals())
          .bold()
        Text((coin.currentHoldings ?? 0).asNumberString())
          .foregroundColor(Color.theme.accent)
    }
  }
  
  private var rightCoulmn: some View {
    VStack(alignment: .trailing) {
      Text(coin.currentPrice.asCurrencyWith2Decimals())
        .bold()
        .foregroundColor(Color.theme.accent)
      Text(coin.priceChangePercentage24H?.asPercentString() ?? "")
        .foregroundColor(
          (coin.priceChangePercentage24H ?? 0) >= 0 ? Color.theme.green : Color.theme.red
        )
    }
    .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
  }
}
