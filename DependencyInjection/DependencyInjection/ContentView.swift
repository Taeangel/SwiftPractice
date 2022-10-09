//
//  ContentView.swift
//  DependencyInjection
//
//  Created by song on 2022/10/09.
//

import SwiftUI
import Combine


// 싱글턴의 문제
// 1 전역
// 2 이니셜라이저를 커스텀 할 수 없다 why? 이 프로그램이 실행될떄 동시에 실행이 되기 떄문에 이니셜라이저를 사용할 수 없다.
// 3 서비스를 여러개 사용할 수 없다 why? 앱이 항상 싱글턴 인스턴스를 참조하게 되므로 정확한 데이터 서비스를 사용해야 하기 떄문에 여러개의 서비스를 사용할 수 없다.

struct PostsModel: Codable, Identifiable {
  let userId: Int
  let id: Int
  let title: String
  let body: String
}

class ProductionDataService {
  
  static let instance = ProductionDataService()
  
  let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
  
  func getData() -> AnyPublisher<[PostsModel], Error> {
    return URLSession.shared.dataTaskPublisher(for: url)
      .map { $0.data }
      .decode(type: [PostsModel].self, decoder: JSONDecoder())
      .receive(on: DispatchQueue.main)
      .eraseToAnyPublisher()
  }
}

class DependencyInjectionViewModel: ObservableObject {
  
  @Published var dataArray: [PostsModel] = []
  var cancellables = Set<AnyCancellable>()
  let dataService: ProductionDataService
  
  init(dataService: ProductionDataService) {
    self.dataService = dataService
    self.loadPosts()
  }
  
  private func loadPosts() {
    dataService.getData()
      .sink(receiveCompletion: { _ in
      }, receiveValue: { [weak self] returnedPost in
        self?.dataArray = returnedPost
      })
      .store(in: &cancellables)
  }
}

struct ContentView: View {
  
  @StateObject private var vm: DependencyInjectionViewModel
  
  init(dataService: ProductionDataService) {
    self._vm = StateObject(wrappedValue: DependencyInjectionViewModel(dataService: dataService))
  }
  
  var body: some View {
    Text("asdasd")
    ScrollView {
      VStack {
        ForEach(vm.dataArray, content: {
          Text("\($0.title)")
        })
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(dataService: ProductionDataService())
  }
}
