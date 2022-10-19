//
//  CommnetViewService.swift
//  SOLID Practice
//
//  Created by song on 2022/10/20.
//

import Foundation

class CommnetViewService {
  func getComments(completion: @escaping(Result<[CommentModel], DemoError>) -> Void) {
    NetworkManager().getComment(completion: completion)
  }
}
