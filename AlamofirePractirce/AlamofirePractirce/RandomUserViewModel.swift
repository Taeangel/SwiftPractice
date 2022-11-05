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
  
  var refreshActionSubject = PassthroughSubject<(), Never>()
  
  var baseUrl = "https://randomuser.me/api/?results=100"
  
  init() {
    self.fetchRandomUsers()
    
    
    refreshActionSubject.sink { [weak self]_ in
      self?.fetchRandomUsers()
    }
    .store(in: &subscription)
  }
  
  
  func fetchRandomUsers() {
    AF.request(baseUrl)
      .publishDecodable(type: RandomUserRespons.self) // 바로 디코딩 제이슨 형태에서
      .compactMap { $0.value } // 이런식으로 옵셔널 처리
      .map { $0.results }
      .sink(receiveCompletion: { completion in
        
        print("데이터 스트림 완료")
      },
            receiveValue: { [weak self] receiveValue in
        print("받은값: \(receiveValue.count)")
        
        self?.randomUsers = receiveValue
       })
      .store(in: &subscription)
  }
  
}
