//
//  ContentView.swift
//  CombineSubscriber
//
//  Created by song on 2022/10/15.
//

import SwiftUI
import Combine


class SubscriberViewModel: ObservableObject {
  
  @Published var count: Int = 0
  
  var timer :AnyCancellable?
  var cancellables = Set<AnyCancellable>()
  
  @Published var textFiledText: String = ""
  
  @Published var combineTextFiledText: String = ""
  @Published var combineTextIsValid: Bool = false
  
  @Published var showButton: Bool = false
  
  init () {
    setUpTimer()
    addTextFieldSubscriber()
    addButtonSubsciber()
  }
  
  func addTextFieldSubscriber() {
    $combineTextFiledText
      .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
      .map { (text) -> Bool in
        if text.count > 3 {
          return true
        }
        return false
      }
//      .assign(to: \.combineTextIsValid, on: self)
      .sink(receiveValue: { [weak self] isValid in
        self?.combineTextIsValid = isValid // 같은
      })
      .store(in: &cancellables)
  }
  
  func addButtonSubsciber() {
    $combineTextIsValid
      .combineLatest($count)
      .sink { [weak self] (isValid, count) in
        
        guard let self = self else { return }
        
        if isValid && count >= 10 {
          self.showButton = true
        } else {
          self.showButton = false
        }
        
      }.store(in: &cancellables)
    
  }
  
  func setUpTimer() {
   Timer
      .publish(every: 1, on: .main, in: .common)
      .autoconnect()
      .sink { [weak self] _ in
        
        guard let self = self else { return }
        self.count += 1
        if self.count >= 10 {
          for item in self.cancellables {
            item.cancel()
          }
        }
      }
      .store(in: &cancellables)
  }
}


struct ContentView: View {
  @ObservedObject var vm = SubscriberViewModel()
  
  var body: some View {
    VStack {
      Text("\(vm.count)")
        .font(.largeTitle)
      
      TextField("여기에 입력", text: $vm.textFiledText)
        .frame(height: 55)
        .background(.white)
      
      
      TextField("컴바인TextField", text: $vm.combineTextFiledText)
        .frame(height: 55)
        .padding(.leading)
        .background(.white)
        .overlay {
          ZStack {
            Image(systemName: "xmark")
              .foregroundColor(.red)
              .opacity(
                vm.combineTextFiledText.count < 1 ? 0.0 :
                vm.combineTextIsValid ? 0.0 : 1.0
              )
            
            Image(systemName: "checkmark")
              .foregroundColor(.green)
              .opacity(vm.combineTextIsValid ? 1.0 : 0.0)
          }
          .font(.title)
          .padding(.trailing)
        }
      
      Text(vm.combineTextIsValid.description)
      
      Button(action: {}) {
        Text("Suvmit".uppercased())
          .font(.headline)
          .foregroundColor(.white)
          .frame(height: 55)
          .frame(maxWidth: .infinity)
          .background(Color.blue)
          .cornerRadius(10)
          .opacity(vm.showButton ? 1.0 : 0.5)
      }
      .disabled(!vm.showButton)
      
    }
    .padding()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
