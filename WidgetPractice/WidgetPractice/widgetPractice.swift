//
//  widgetPractice.swift
//  widgetPractice
//
//  Created by song on 2022/11/08.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
  func placeholder(in context: Context) -> DayEntry {
    DayEntry(date: Date())
  }
  
  func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (DayEntry) -> ()) {
    let entry = DayEntry(date: Date())
    completion(entry)
  }
  
  func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
    var entries: [DayEntry] = []
    var policy: TimelineReloadPolicy = .atEnd
    
    let entry = DayEntry(date: Date())
    entries.append(entry)
    
    let timeline = Timeline(entries: entries, policy: .atEnd)
    completion(timeline)
  }
}

struct DayEntry: TimelineEntry {
  let date: Date
}

struct widgetPracticeEntryView : View {
  var entry: Provider.Entry
  
  var body: some View {
    ZStack {
      ContainerRelativeShape()
        .fill(.gray.gradient)
      
      VStack {
        HStack {
          Text("⛄️")
          Text(entry.date.weekdayDisplayFormat)
          Spacer()
        }
        
        Text(entry.date.dayDisplayFormat)
      }
    }
  }
}

@main
struct widgetPractice: Widget {
  let kind: String = "widgetPractice"
  
  var body: some WidgetConfiguration {
    IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
      widgetPracticeEntryView(entry: entry)
    }
    .configurationDisplayName("My Widget")
    .description("This is an example widget.")
  }
}

struct widgetPractice_Previews: PreviewProvider {
  static var previews: some View {
    widgetPracticeEntryView(entry: DayEntry(date: Date()))
      .previewContext(WidgetPreviewContext(family: .systemSmall))
  }
}


extension Date {
  var weekdayDisplayFormat: String {
    self.formatted(.dateTime.weekday(.wide))
  }
  
  var dayDisplayFormat: String {
    self.formatted(.dateTime.day())
  }
}
