//
//  CircleButtonView.swift
//  TCAProject
//
//  Created by song on 2022/12/03.
//

import SwiftUI

struct CircleButtonView: View {
  
  let iconeName: String
  
  var body: some View {
    Image(systemName: iconeName)
      .font(.headline)
      .foregroundColor(Color.theme.accent)
      .frame(width: 50, height: 50)
      .background(
        Circle().foregroundColor(Color.theme.background)
      )
      .shadow(color: Color.theme.accent.opacity(0.25),
              radius: 10,
              x: 0,
              y: 0)
      .padding()
  }
}
