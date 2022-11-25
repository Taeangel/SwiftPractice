//
//  PortfolioView.swift
//  CoinApp
//
//  Created by song on 2022/11/24.
//

import SwiftUI

struct PortfolioView: View {
  @EnvironmentObject private var vm: HomeViewModel
  @State private var selectedCoin: CoinModel? = nil
  @State private var quantityText: String = ""
  @State private var showCheckmark: Bool = false
  @Environment(\.dismiss) private var dismiss
  
  var body: some View {
    NavigationView {
      ScrollView {
        VStack(alignment: .leading, spacing: 0) {
          
          SearchBarView(seachText: $vm.searchText)
          
          coinLogoList
          
          if selectedCoin != nil {
            portfolioInputSection
          }
        }
      }
      .navigationTitle("Edit Portfolio")
      .toolbar(content: {
        ToolbarItem(placement: .navigationBarLeading) {
          leadingNavBarButton
        }
        
        ToolbarItem(placement: .navigationBarTrailing) {
          trailingNavBarButton
        }
      })
      .onChange(of: vm.searchText) { value in
        if value == "" {
          removeSelectedCoin()
        }
      }
    }
  }
}

struct PortfolioView_Previews: PreviewProvider {
  static var previews: some View {
    PortfolioView()
      .environmentObject(dev.homeVM)
  }
}

extension PortfolioView {
  
  private var coinLogoList: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      LazyHStack(spacing: 10) { //한번에 모두 만들기 위해서 선택함
        ForEach(vm.searchText.isEmpty ? vm.portfolioCoins : vm.allCoins) { coin in
          CoinLogoView(coin: coin)
            .frame(width: 75)
            .padding(4)
            .onTapGesture {
              withAnimation(.easeIn) {
                updateSelectedCoin(coin: coin)
              }
            }
            .background{
              RoundedRectangle(cornerRadius: 10)
                .stroke(selectedCoin?.id == coin.id ? Color.theme.green : Color.clear, lineWidth: 1)
                .foregroundColor(Color.theme.background)
            }
        }
        .frame(height: 120)
        .padding(.leading)
      }
    }
  }
  
  private var portfolioInputSection: some View {
    VStack(spacing: 20) {
      HStack {
        Text("current price of \(selectedCoin?.symbol.uppercased() ?? "")")
        Spacer()
        
        Text(selectedCoin?.currentPrice.asCurrencyWith2Decimals() ?? "")
      }
      Divider()
      HStack {
        Text("Amount holding")
        Spacer()
        TextField("Ex: 1.4", text: $quantityText)
          .multilineTextAlignment(.trailing)
          .keyboardType(.decimalPad)
      }
      Divider()
      HStack {
        Text("Cyrrent value: ")
        Spacer()
        Text(getCurrentValue().asCurrencyWith2Decimals())
      }
    }
    .padding()
    .font(.headline)
  }
  
  private var leadingNavBarButton: some View {
    Button(action: {
      dismiss()
    },     label: {
      Image(systemName: "xmark")
        .font(.headline)
    })
  }
  
  private var trailingNavBarButton: some View {
    HStack {
      Image(systemName: "checkmark")
        .opacity(showCheckmark ? 1.0 : 0.0)
      
      Button(action: {
        saveButtonPressed()
      },
             label: {
        Text("SAVE")
      })
      .opacity(
        (selectedCoin != nil && selectedCoin?.currentHoldings != Double(quantityText)) ? 1.0 : 0.0
      )
    }
  }
  
  private func updateSelectedCoin(coin: CoinModel) {
    selectedCoin = coin
    
    if let portfolioCoin = vm.portfolioCoins.first(where: { $0.id == coin.id }),
       let amount = portfolioCoin.currentHoldings {
      quantityText = "\(amount)"
    } else {
      quantityText = ""
    }
  }
 
  private func getCurrentValue() -> Double {
    if let quantity = Double(quantityText) {
      return quantity * (selectedCoin?.currentPrice ?? 0)
    }
    return 0
  }
  
  private func saveButtonPressed() {
    guard let coin = selectedCoin, let amount = Double(quantityText) else { return }
    
    // save to portfolio
    vm.updatePortfolio(coin: coin, amount: amount)
    
    // show checkmark
    withAnimation(.easeIn) {
      showCheckmark = true
      removeSelectedCoin()
    }
    
    // hide keyboard
    UIApplication.shared.endEditing()
  
    
    //hide checkmakr
    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
      withAnimation(.easeIn) {
        showCheckmark = false
      }
    }
  }
  
  private func removeSelectedCoin() {
    selectedCoin = nil
    vm.searchText = ""
  }
}
