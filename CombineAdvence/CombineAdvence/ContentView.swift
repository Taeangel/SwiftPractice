//
//  ContentView.swift
//  CombineAdvence
//
//  Created by song on 2022/10/16.
//

import SwiftUI
import Combine

class AdvenceCombineDataService {
  
  @Published var baseicPublisher: [String] = []
  
  init() {
    publishFakeData()
  }
  
  private func publishFakeData() {
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
      self.baseicPublisher = ["one", "two", "three"]
    }
  }
}


class AdvancedCombineViewModel: ObservableObject {
  
  let dataService = AdvenceCombineDataService()
  @Published var data: [String] = []
  
  var cancellables = Set<AnyCancellable>()
  
  init() {
    addSubscribers()
  }
  
  private func addSubscribers() {
    dataService.$baseicPublisher
      .sink(
        receiveCompletion: { completion in
          switch completion {
          case .finished:
            break
          case .failure(let error):
            print("Error: \(error)")
          }
          
        },
        receiveValue: { [weak self] returnedValue in
          guard let self = self else { return }
          self.data = returnedValue
          
        })
      .store(in: &cancellables)
  }
}

struct ContentView: View {
  
  @StateObject var viewModele = AdvancedCombineViewModel()
  
  var body: some View {
    ScrollView {
      VStack {
        ForEach(viewModele.data, id: \.self) { item in
          Text(item)
            .font(.largeTitle)
            .fontWeight(.black)
        }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
