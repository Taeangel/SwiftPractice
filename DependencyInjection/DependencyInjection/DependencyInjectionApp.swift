//
//  DependencyInjectionApp.swift
//  DependencyInjection
//
//  Created by song on 2022/10/09.
//

import SwiftUI

@main
struct DependencyInjectionApp: App {
    var body: some Scene {
      let dataService: ProductionDataService = ProductionDataService(url: URL(string: "https://jsonplaceholder.typicode.com/posts")!)
      
      let mockDataService: MockDataService = MockDataService(data: nil)
      
        WindowGroup {
            ContentView(dataService: mockDataService)
        }
    }
}
