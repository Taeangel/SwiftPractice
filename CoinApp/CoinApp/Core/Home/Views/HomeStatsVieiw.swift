//
//  HomeStatsVieiw.swift
//  CoinApp
//
//  Created by song on 2022/11/23.
//

import SwiftUI

struct HomeStatsVieiw: View {
  @Binding var showPortfolio: Bool
  @EnvironmentObject private var vm: HomeViewModel
  var body: some View {
    
    HStack {
      ForEach(vm.statistics) { stat in
        StatisticView(stat: stat)
          .frame(width:  UIScreen.main.bounds.width / 3)
      }
      
    }
    .frame(width: UIScreen.main.bounds.width ,
           alignment: showPortfolio ? .trailing : .leading)
  }
}

struct HomeStatsVieiw_Previews: PreviewProvider {
  static var previews: some View {
    HomeStatsVieiw(showPortfolio: .constant(false))
      .environmentObject(dev.homeVM)
  }
}
