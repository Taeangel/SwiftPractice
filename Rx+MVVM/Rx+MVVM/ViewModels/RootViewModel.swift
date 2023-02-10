//
//  RootViewModel.swift
//  Rx+MVVM
//
//  Created by song on 2023/02/01.
//

import Foundation
import RxSwift

final class RootViewModel {
  let title = "asdfasd0"
  
  private let articleService: ArtocleServiceProtocol
  
  init(articleService: ArtocleServiceProtocol) {
    self.articleService = articleService
  }
  
  func fetchArticles() -> Observable<[ArticleViewModel]> {
    self.articleService.fetchNews()
      .map { $0.map { ArticleViewModel(article: $0) } }
  }
}
 
