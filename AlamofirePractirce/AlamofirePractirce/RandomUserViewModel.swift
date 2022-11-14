//
//  RandomUserViewModel.swift
//  AlamofirePractirce
//
//  Created by song on 2022/11/05.
//

import Foundation
import Combine
import Alamofire

class RandomUserViewModel: ObservableObject {
  
  var subscription = Set<AnyCancellable>()  // 메모리에서 구독해제
  
  @Published var randomUsers = [RandomUser]()
  
  @Published var pageInfo: Info? {
    didSet {
      print("pageInfo: \(pageInfo?.description)")
    }
  }
  
  @Published var isLpading: Bool = false
  
  var refreshActionSubject = PassthroughSubject<(), Never>()
  var fetchMoreActionSubject = PassthroughSubject<(), Never>()

  var baseUrl = "https://randomuser.me/api/?results=100"
  
  init() {
    self.fetchRandomUsers()
    
    refreshActionSubject.sink { [weak self]_ in
      self?.fetchRandomUsers()
    }
    .store(in: &subscription)
    
    fetchMoreActionSubject.sink { [weak self] in
      guard let self = self else {
        return
      }
      
      if !self.isLpading { // 순간적으로 2개가 동시에 요청이 될 수 있기 떄문에
        self.fetchMore()
      }
     
    }
    .store(in: &subscription)
  }
  
  func fetchMore() {
    guard let currentPage = pageInfo?.page else {
      return
    }
    
    self.isLpading = true
    
    let pageToLoad = currentPage + 1
    AF.request(RandomUserRouter.getUsers(page: pageToLoad))
      .publishDecodable(type: RandomUserRespons.self) // 바로 디코딩 제이슨 형태에서
      .compactMap { $0.value } // 이런식으로 옵셔널 처리
      .sink(receiveCompletion: { completion in
        self.isLpading = false
        print("데이터 스트림 완료")
      },
            receiveValue: { [weak self] receiveValue in
        print("받은값: \(receiveValue.results.count)")
        
        self?.randomUsers += receiveValue.results
        self?.pageInfo = receiveValue.info
       })
      .store(in: &subscription)
  }
  
  func fetchRandomUsers() {
    AF.request(RandomUserRouter.getUsers())
      .publishDecodable(type: RandomUserRespons.self) // 바로 디코딩 제이슨 형태에서
      .compactMap { $0.value } // 이런식으로 옵셔널 처리
      .sink(receiveCompletion: { completion in
        
        print("데이터 스트림 완료")
      },
            receiveValue: { [weak self] receiveValue in
        print("받은값: \(receiveValue.results.count)")
        
        self?.randomUsers = receiveValue.results
        self?.pageInfo = receiveValue.info
       })
      .store(in: &subscription)
  }
}
