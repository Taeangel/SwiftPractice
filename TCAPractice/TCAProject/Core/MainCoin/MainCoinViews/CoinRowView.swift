//
//  CoinRowView.swift
//  TCAProject
//
//  Created by song on 2022/12/03.
//

import SwiftUI
import ComposableArchitecture

struct CoinRowView: View {
  let coin: CoinModel
  let showHoldingColumn: Bool
  
  
  var body: some View {
    HStack(spacing: 3) {
      Text("\(coin.rank)")
        .font(.caption)
        .foregroundColor(Color.theme.secondaryText)
      Text(coin.symbol)
      
      Spacer()
      
      VStack(alignment: .trailing) {
        Text("\(coin.currentHoldingsValue)")
          .bold()
        Text("\(coin.currentHoldings ?? 0)")
          .foregroundColor(Color.theme.accent)
      }
      
      Spacer()
      
      VStack(alignment: .trailing) {
        Text("\(coin.currentPrice)")
        
        Text("\(coin.priceChangePercentage24H ?? 0)")
      }
    }
  }
}



struct CoinRowView_Previews: PreviewProvider {
  static var previews: some View {
    CoinRowView(coin: dev.coin, showHoldingColumn: true)
    
    CoinRowView(coin: dev.coin, showHoldingColumn: true)
      .preferredColorScheme(.dark)
  }
}
