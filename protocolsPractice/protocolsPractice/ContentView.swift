//
//  ContentView.swift
//  protocolsPractice
//
//  Created by song on 2022/10/07.
//

import SwiftUI

struct DefaultColorTheme {
  let primary: Color = .blue
  let secondary: Color = .white
  let tertiary: Color = .gray
}

struct AlternativeColorTheme: ColorThemeProtocol {
  let primary: Color = .red
  let secondary: Color = .white
  let tertiary: Color = .green
}

struct AnothercolerTheme: ColorThemeProtocol {
  var primary: Color = .brown
  var secondary: Color = .yellow
  var tertiary: Color = .primary
}

protocol ButtonPressedProtocol {
  func buttonPressed()
  
}

protocol ButtonTextProtocol {
  var buttonText: String { get }
  
}

protocol ButtonDataSourceProtocol: ButtonTextProtocol, ButtonPressedProtocol { }

class DefaultDataSource: ButtonDataSourceProtocol {
  
  func buttonPressed() {
    print("버튼눌림")
  }
  
  var buttonText: String = "Protocols are awsome!"
}

class AlternativeDataSource {
  var buttonText: String = "Protocols are lame."
}

protocol ColorThemeProtocol {
  var primary: Color { get }
  var secondary: Color { get }
  var tertiary: Color { get }
}


struct ProtocolsBootcamp: View {
  
  let colorTheme: ColorThemeProtocol
  let dataSource: ButtonDataSourceProtocol
  
  var body: some View {
    ZStack {
      colorTheme.tertiary
        .ignoresSafeArea()
      Text("Protocols are awesome!")
        .font(.headline)
        .foregroundColor(colorTheme.secondary)
        .padding(.all)
        .background(colorTheme.primary)
        .cornerRadius(10)
        .onTapGesture {
          dataSource.buttonPressed()
        }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ProtocolsBootcamp(colorTheme: AlternativeColorTheme(), dataSource: DefaultDataSource())
  }
}
