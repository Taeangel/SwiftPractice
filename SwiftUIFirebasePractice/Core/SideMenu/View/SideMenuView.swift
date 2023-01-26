//
//  SideMenuView.swift
//  SwiftUIFirebasePractice
//
//  Created by song on 2023/01/26.
//

import SwiftUI

struct SideMenuView: View {
  
  @EnvironmentObject var authViewModel: AuthViewModel
  
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
      
      ForEach(SideMenuViewModel.allCases, id: \.rawValue) { sideMenuViewModel in
        if sideMenuViewModel == .profile {
          NavigationLink {
            ProfileView()
          } label: {
            SideMenuOptionRowView(viewModel: sideMenuViewModel)
          }
        } else if sideMenuViewModel == .logout {
          Button(action: {
            authViewModel.signOut()
          },
                 label: {
            SideMenuOptionRowView(viewModel: sideMenuViewModel)

          })
          
        } else {
          SideMenuOptionRowView(viewModel: sideMenuViewModel)

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

