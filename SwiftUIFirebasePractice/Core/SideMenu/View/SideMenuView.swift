//
//  SideMenuView.swift
//  SwiftUIFirebasePractice
//
//  Created by song on 2023/01/26.
//

import SwiftUI

struct SideMenuView: View {
  var body: some View {
    VStack(alignment: .leading) {
      VStack(alignment: .leading) {
        Circle()
          .frame(width: 48, height: 48)
        
        Text("Bruce Wayne")
          .font(.headline)
        
        Text("@bbatman")
          .font(.caption)
          .foregroundColor(.gray)
        
        UserStatsView()
        
        }
      .padding(.leading)
      
      ForEach(SideMenuViewModel.allCases, id: \.rawValue) { viewModel in
        if viewModel == .profile {
          NavigationLink {
            ProfileView()
          } label: {
            SideMenuOptionRowView(viewModel: viewModel)
          }
        } else if viewModel == .logout {
          Button(action: {
            
          },
                 label: {
            SideMenuOptionRowView(viewModel: viewModel)

          })
          
        } else {
          SideMenuOptionRowView(viewModel: viewModel)

        }
      }
      .padding(.vertical, 4)
      
      Spacer()
    }
  }
}

struct SideMenuView_Previews: PreviewProvider {
  static var previews: some View {
    SideMenuView()
  }
}

