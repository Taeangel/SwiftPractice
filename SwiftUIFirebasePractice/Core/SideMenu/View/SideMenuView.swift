//
//  SideMenuView.swift
//  SwiftUIFirebasePractice
//
//  Created by song on 2023/01/26.
//

import SwiftUI
import Kingfisher

struct SideMenuView: View {
  
  @EnvironmentObject var authViewModel: AuthViewModel
  
  var body: some View {
    if let user = authViewModel.currentUser {
      VStack(alignment: .leading) {
        VStack(alignment: .leading) {
          KFImage(URL(string: user.profileImageUrl))
            .resizable()
            .scaledToFill()
            .clipShape(Circle())
            .frame(width: 48, height: 48)
          
          Text(user.fullname)
            .font(.headline)
          
          Text("@\(user.username)")
            .font(.caption)
            .foregroundColor(.gray)
          
//          UserStatsView()
          
          }
        .padding(.leading)
        
        ForEach(SideMenuViewModel.allCases, id: \.rawValue) { sideMenuViewModel in
          if sideMenuViewModel == .profile {
            NavigationLink {
              ProfileView(user: user)
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
}

struct SideMenuView_Previews: PreviewProvider {
  static var previews: some View {
    SideMenuView()
  }
}

