//
//  protocolsPracticeApp.swift
//  protocolsPractice
//
//  Created by song on 2022/10/07.
//

import SwiftUI

@main
struct protocolsPracticeApp: App {
    var body: some Scene {
        WindowGroup {
          ProtocolsBootcamp(colorTheme: AlternativeColorTheme(), dataSource: DefaultDataSource())
        }
    }
}
