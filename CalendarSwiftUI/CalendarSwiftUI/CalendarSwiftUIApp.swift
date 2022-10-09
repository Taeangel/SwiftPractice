//
//  CalendarSwiftUIApp.swift
//  CalendarSwiftUI
//
//  Created by song on 2022/10/03.
//

import SwiftUI

@main
struct CalendarSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
          let dataHolder = DateHolder()
            ContentView()
            .environmentObject(dataHolder)
        }
    }
}
