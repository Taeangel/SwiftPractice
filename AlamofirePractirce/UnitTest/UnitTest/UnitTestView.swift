//
//  ContentView.swift
//  UnitTest
//
//  Created by song on 2022/12/30.
//


/*
 1. Unit Test
 test the business logic in your app
 
 2. UI Test
 - tests the UI of your app
 */

import SwiftUI

struct UnitTestView: View {
  
  @StateObject private var vm: UnitTestViewModel
  
  init(isPremium: Bool) {
    self._vm = StateObject(wrappedValue: UnitTestViewModel(isPremium: isPremium))
  }
  
  var body: some View {
    Text(vm.isPremium.description)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    UnitTestView(isPremium: true)
  }
}
