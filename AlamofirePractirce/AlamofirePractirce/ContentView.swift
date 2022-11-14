//
//  ContentView.swift
//  AlamofirePractirce
//
//  Created by song on 2022/11/05.
//

import SwiftUI
import Introspect
import UIKit

class RefreshControlHellper {
  var parentContentView: ContentView?
  var refreshControl: UIRefreshControl?
  
  //리프레쉬에다 메서드를 달기 위해서는 오브젝티프c 메서드가 필요
  
  @objc
  func didRefresh() {
    guard let parentContentView = parentContentView,
          let refreshControl = refreshControl else {
      return
    }
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.7, execute: {
//      parentContentView.vm.fetchRandomUsers() // viewModel에 있는 메서드를 직접 사용하는 것보다 이방법이 좀더 효과적
      parentContentView.vm.refreshActionSubject.send()
      refreshControl.endRefreshing()
    })
  }
}

struct ContentView: View {
  @StateObject var vm = RandomUserViewModel()
  let refreshControlHelper = RefreshControlHellper()
  
  let url = URL(string: "https://randomuser.me/api/portraits/women/91.jpg")!
  var body: some View {
    ScrollView {
      ForEach(vm.randomUsers) {  randomUser in
    
        RandomUserView(randomUser)
          .onAppear {
            print("마지막이다")
            if self.vm.randomUsers.last == randomUser {
              print("마지막이다!!!")
            }
          }
      }
    }
    .introspectScrollView { scrollView in
      configureRefreshControl(scrollView)
    }
    
    if vm.isLpading {
      ProgressView()
        .progressViewStyle(CircularProgressViewStyle(tint: Color.gray))
    }
  }
}

// MARK: - Helper Methods
extension ContentView {
  fileprivate func configureRefreshControl(_ scrollView: UIScrollView) {
    let myrefreshControl = UIRefreshControl()
    refreshControlHelper.refreshControl = myrefreshControl
    refreshControlHelper.parentContentView = self
    myrefreshControl.addTarget(refreshControlHelper, action: #selector(RefreshControlHellper.didRefresh), for: .valueChanged)
    scrollView.refreshControl = myrefreshControl
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
