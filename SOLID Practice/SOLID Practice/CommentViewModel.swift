//
//  CommentViewModel.swift
//  SOLID Practice
//
//  Created by song on 2022/10/20.
//

import Foundation

class CommentViewModel: ObservableObject {
  @Published var comment = [CommentModel]()
  
  func fetchComments() {
    DispatchQueue.main.async {
      CommnetViewService().getComments { result in
        switch result {
        case .success(let comment):
          
          self.comment = comment
          
        case .failure(let error):
          print()
        }
      }
    }
  }
  
  
}
