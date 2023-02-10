//
//  ArticleViewModel.swift
//  Rx+MVVM
//
//  Created by song on 2023/02/01.
//

import Foundation
import RxSwift

struct ArticleViewModel {
  private let article: Article
  
  var imageUrl: String? {
    return article.urlToImage
  }
  
  var title: String? {
    return article.title
  }

  var description: String? {
    return article.description
  }

  init(article: Article) {
    self.article = article
  }
}
