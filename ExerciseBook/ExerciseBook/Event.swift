import SwiftUI
import EventKit

struct Event: Hashable {
  var ekevent: EKEvent
  var category: EKCalendar
}

struct Reminder: Hashable {
  var ekreminder: EKReminder
  var category: EKCalendar
}

struct EventListView: View {
  var store: EKEventStore = EKEventStore()
  @State var events: [Event] = []
  @State var allReminders: [Reminder] = []
  
  var body: some View {
    VStack {
      
      Text("EVENT")
      ForEach(events, id: \.self) { event in
        Text(event.ekevent.title)
          .padding()
          .frame(maxWidth: .infinity)
          .background(Color(event.category.cgColor))
          .cornerRadius(8)
          .padding(.horizontal)
          .foregroundColor(.white)
      }
      
      Text("REMINDER")
      List(allReminders, id: \.self) { reminder in
        HStack {
          Button {
            reminder.ekreminder.isCompleted.toggle()
            do {
              try store.save(reminder.ekreminder, commit: true)
              getReminder()
            } catch {
              print(error)
            }
          } label: {
            if reminder.ekreminder.isCompleted {
              Image(systemName: "circle.fill")
                .foregroundColor(Color(reminder.category.cgColor))
            } else {
              Image(systemName: "circle")
                .foregroundColor(Color(reminder.category.cgColor))
            }
          }
          Text(reminder.ekreminder.title)
        }
        
      }
    }
    .onAppear {
      
      checkPermission()
      // 권한 얻기
      store.requestAccess(to: .reminder) { granted, error in
        if granted == true {
          print("권한 얻기 성공")
        } else {
          print("에러 : \(String(describing: error?.localizedDescription))")
        }
      }
      
      store.requestAccess(to: .event) { granted, error in
        if granted == true {
          print("권한 얻기 성공")
        } else {
          print("에러 : \(String(describing: error?.localizedDescription))")
        }
      }
      
      getReminder()
      getEvent()
      
    }
  }
  
  func checkPermission() {
    switch EKEventStore.authorizationStatus(for: .event) {
    case .authorized:
      print("승인 성공 🥳")
    case .notDetermined:
      print("결정되지 않음, 아직 안 물어봄")
    case .denied:
      print("승인 거절 😈")
    case .restricted:
      print("제한된 승인 🤔")
    @unknown default:
      print("😳")
    }
  }
  
  func getEvent() {
    // Get the appropriate calendar.
    var calendar = Calendar.current
    
    // Create the start date components
    var oneDayAgoComponents = DateComponents()
    oneDayAgoComponents.day = -10
    var oneDayAgo = calendar.date(byAdding: oneDayAgoComponents, to: Date(), wrappingComponents: false)
    
    // Create the end date components.
    var oneYearFromNowComponents = DateComponents()
    oneYearFromNowComponents.year = 1
    var oneYearFromNow = calendar.date(byAdding: oneYearFromNowComponents, to: Date(), wrappingComponents: false)

    // Create the predicate from the event store's instance method.

    guard let anAgo = oneDayAgo, let aNow = oneYearFromNow else { return }
    print(anAgo)
    print(aNow)
    
    let category = store.calendars(for: .event)
    
    for category in category {
      print(category.title)
      
      if category.title == "Siri Suggestions" || category.title == "US Holidays" || category.title == "Birthdays" {
        print("####")
        // 위에 카테고리들은 가져오지 않음
      } else {
        var predicate: NSPredicate? = nil
        predicate = store.predicateForEvents(withStart: anAgo, end: aNow, calendars: [category])
        if let aPredicate = predicate {
          let list = store.events(matching: aPredicate)
          for list in list {
            let event = Event(ekevent: list, category: category)
            events.append(event)
          }
          //        events[category.title]?.append(contentsOf: store.events(matching: aPredicate))
        }
      }
    }
    print(events)
  }
  
  func getReminder() {
    allReminders.removeAll()
    let category = store.calendars(for: .reminder)
    
    for category in category {
      let predicate: NSPredicate? = store.predicateForReminders(in: [category])
      
      if let aPredicate = predicate {
        store.fetchReminders(matching: aPredicate, completion: {(_ reminders: [Any]?) -> Void in
          for reminder: EKReminder? in reminders as? [EKReminder?] ?? [EKReminder?]() {
            let re = Reminder(ekreminder: reminder!, category: category)
            allReminders.append(re)
            // Do something for each reminder.
          }
        })
      }
    }
  }
}
