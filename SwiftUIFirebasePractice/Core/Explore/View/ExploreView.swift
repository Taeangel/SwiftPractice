//
//  ExploreView.swift
//  SwiftUIFirebasePractice
//
//  Created by song on 2023/01/24.
//

import SwiftUI

struct ExploreView: View {
  var body: some View {
    NavigationView {
      VStack {
        ScrollView {
          LazyVStack {
            ForEach(0...25, id: \.self) { _ in
              NavigationLink(
                destination: {
                  ProfileView()
                },
                label: {
                  UserRowView()
                })
            }
          }
        }
      }
      .navigationTitle("Explore")
      .navigationBarTitleDisplayMode(.inline)
    }
  }
}

struct ExploreView_Previews: PreviewProvider {
  static var previews: some View {
    ExploreView()
  }
}
