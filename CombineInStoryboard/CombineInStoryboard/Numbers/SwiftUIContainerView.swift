//
//  SwiftUIContainerView.swift
//  CombineInStoryboard
//
//  Created by song on 2022/11/03.
//
import UIKit
import SwiftUI

struct SwiftUIContainerView: View {
  
  @StateObject var vm = SwiftUIContainerViewModel()
  
  var body: some View {
    VStack {
      
      TextField("", text: $vm.number1)
        .background(Color.pink)
      TextField("", text: $vm.number2)
        .background(Color.pink)
      TextField("", text: $vm.number3)
        .background(Color.pink)
      TextField("", text: $vm.number4)
        .background(Color.pink)
    }
    
    Text($vm.resultValue.wrappedValue)
    
  }
}

extension View {
  func getContainerVC() -> UIViewController {
    return NumbersSwiftUiViewContainerVC(swiftUIView: self)
  }
}

