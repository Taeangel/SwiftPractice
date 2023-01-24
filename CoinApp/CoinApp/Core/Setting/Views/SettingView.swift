//
//  SettingView.swift
//  CoinApp
//
//  Created by song on 2022/11/29.
//

import SwiftUI

struct SettingView: View {
  @Environment(\.dismiss) private var dismiss
  let defaultURL = URL(string: "https://www.google/com")!
  let coingeckoURL = URL(string: "https://www.coingecko.com")!
  let youtubeURL = URL(string: "https://www.youtube.com./c/swiftulthinking")!

  var body: some View {
    NavigationView {
      List {
        swiftulThinkingSection
        
        coingeckoSection
      }
      .tint(.blue)
      .listStyle(GroupedListStyle())
      .navigationTitle("Setting")
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          leadingNavBarButton
        }
      }
    }
  }
}

struct SettingView_Previews: PreviewProvider {
  static var previews: some View {
    SettingView()
  }
}

extension SettingView {
  
  private var leadingNavBarButton: some View {
    Button(action: {
      dismiss()
    },     label: {
      Image(systemName: "xmark")
        .font(.headline)
    })
  }
  
  private var swiftulThinkingSection: some View {
    Section(header: Text("header")) {
      VStack(alignment: .leading) {
        Image("logo")
          .resizable()
          .frame(width: 100, height: 100)
          .clipShape(RoundedRectangle(cornerRadius: 20))
        Text("This app was made by following a @SwiftUIThinking")
          .font(.callout)
          .fontWeight(.medium)
          .foregroundColor(Color.theme.accent)
        
      }
      .padding()
      
      Link("Thanks to SwiftUI Thinking", destination: youtubeURL)
      
    }
  }
  
  private var coingeckoSection: some View {
    Section(header: Text("CoinGecko")) {
      VStack(alignment: .leading) {
        Image("coingecko")
          .resizable()
          .scaledToFit()
          .frame(height: 100)
          .clipShape(RoundedRectangle(cornerRadius: 20))
        Text("This app was made by CoinGecko API ")
          .font(.callout)
          .fontWeight(.medium)
          .foregroundColor(Color.theme.accent)
        
      }
      .padding()
      
      Link("Thanks to Coingecko", destination: coingeckoURL)
      
    }
  }
  
  
  
  
}
