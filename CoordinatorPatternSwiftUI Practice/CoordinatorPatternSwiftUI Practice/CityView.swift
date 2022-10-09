//
//  CityView.swift
//  CoordinatorPatternSwiftUI Practice
//
//  Created by song on 2022/10/06.
//

import SwiftUI

struct CityView: View {
  
  @EnvironmentObject var coordinator: Coordinator<MapRouter>
  
  let name: String
  
  var body: some View {
    VStack {
      Text(name)
      Button("Back") {
        coordinator.pop()
      }
      Button("Move to Map") {
        coordinator.popToRoot()
      }
      Button("Next City") {
        coordinator.show(.city(named: name + " " + name))
      }
    }.navigationBarHidden(true)
  }
}
