//
//  MapView.swift
//  CoordinatorPatternSwiftUI Practice
//
//  Created by song on 2022/10/06.
//

import SwiftUI

struct MapView: View {
  
  @EnvironmentObject var coordinator: Coordinator<MapRouter>
  
  var body: some View {
    NavigationView {
      Button("Go to the city") {
        coordinator.show(.city(named: "El Paso"))
      }
    }
  }
}
