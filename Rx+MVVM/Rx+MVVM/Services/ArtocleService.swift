//
//  ArtocleService.swift
//  Rx+MVVM
//
//  Created by song on 2023/02/01.
//

import Foundation
import Alamofire
import RxSwift

protocol ArtocleServiceProtocol {
  func fetchNews() -> Observable<[Article]>
}

class ArtocleService: ArtocleServiceProtocol {
  
  func fetchNews() -> Observable<[Article]> {
    return Observable.create { observer -> Disposable in
      self.fetchNews { result in
        switch result {
        case let .failure(error):
          return observer.onError(error)
        case let .success(articles):
          return observer.onNext(articles)
        }
//        observer.onCompleted() 이건 어따 써야댐?
      }
      
      return Disposables.create()
    }
    
  }
  
private func fetchNews(completion: @escaping(Result<[Article], ApiError>) -> ()) {
    let urlString = "https://newsapi.org/v2/everything?q=tesla&from=2023-01-01&sortBy=publishedAt&apiKey=55f7d4bd9ec843549b6f422eaad04b57"
    
    guard let url = URL(string: urlString) else {
      return completion(.failure(.defaultErrpr))
    }
    
    AF
      .request(url, encoding: JSONEncoding.default)
      .responseDecodable(of: ArticleResponse.self) { response in
        
        if let error = response.error {
          return completion(.failure(.responsError(error) ))
        }
        
        if let articles = response.value?.articles {
          return completion(.success(articles))
        }
      }
  }
}

enum ApiError: Error {
  case defaultErrpr
  case responsError(_ error: Error?)
}
