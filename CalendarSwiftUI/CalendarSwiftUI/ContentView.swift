//
//  ContentView.swift
//  CalendarSwiftUI
//
//  Created by song on 2022/10/03.
//

import SwiftUI

struct ContentView: View {
  @EnvironmentObject var dateHolder: DateHolder
  
  var body: some View {
    VStack(spacing: 1) {
      DateScrollerView()
        .environmentObject(dateHolder)
        .padding()
      
      dayOfWeekStack
      
      calendarGrid
    }
    
    
  }
  
  var dayOfWeekStack: some View {
    HStack(spacing: 1) {
      Text("Sun").dayOfWeek()
      Text("Mon").dayOfWeek()
      Text("Tue").dayOfWeek()
      Text("Wed").dayOfWeek()
      Text("Thu").dayOfWeek()
      Text("Fri").dayOfWeek()
      Text("Sat").dayOfWeek()
    }
  }
  
  var calendarGrid: some View {
    
    VStack(spacing: 1) {
      
      let daysInMonth = CalendarHelper().daysInMonth(dateHolder.date)
      let firstDayOfMonth = CalendarHelper().firstOfMonth(dateHolder.date)
      let startingSpace = CalendarHelper().weekDay(firstDayOfMonth)
      let prevMonth = CalendarHelper().minusMonth(dateHolder.date)
      let daysInPrevMonth = CalendarHelper().daysInMonth(prevMonth) 
      
      ForEach(0..<6) { row in
        HStack(spacing: 1) {
          ForEach(1..<8) { column in
            let count = column + (row * 7)
            CalendarCell(count: count, startingSpaces: startingSpace, daysInMonth: daysInMonth, daysInPrevMonth: daysInPrevMonth)
              .environmentObject(dateHolder)
          }
        }
      }
    }
//    .frame(maxWidth: .infinity)
  }
}

extension Text {
  func dayOfWeek() -> some View {
    self.frame(maxWidth: .infinity)
      .padding(.top)
      .lineLimit(1)
  }
}
