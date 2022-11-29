//
//  SettingView.swift
//  CoinApp
//
//  Created by song on 2022/11/29.
//

import SwiftUI

struct SettingView: View {
  var body: some View {
    NavigationView {
      List {
        Text("Hi")
      }
      .navigationTitle("Setting")
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          
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
