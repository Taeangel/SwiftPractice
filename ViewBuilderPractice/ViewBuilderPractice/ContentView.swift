//
//  ContentView.swift
//  ViewBuilderPractice
//
//  Created by song on 2022/10/15.

import SwiftUI

struct HeaderViewRegular: View {
  let title: String
  let description: String?
  let iconName: String?
  
  var body: some View {
    
    VStack {
      Text(title)
        .font(.largeTitle)
        .fontWeight(.semibold)
      
      if let description = description {
        Text(description)
          .font(.callout)
      }
      if let iconName = iconName {
        Image(systemName: iconName)
          .font(.callout)
      }
      
      RoundedRectangle(cornerRadius: 5)
        .frame(height: 2)
    }
    .frame(maxWidth: .infinity, alignment: .leading)
    .padding()
  }
}

struct HeaderViewGeneric<CustomType: View>: View {
  let title: String
  let content: CustomType
  
  var body: some View {
    
    VStack {
      Text(title)
        .font(.largeTitle)
        .fontWeight(.semibold)
      
      content
      
      RoundedRectangle(cornerRadius: 5)
        .frame(height: 2)
    }
    .frame(maxWidth: .infinity, alignment: .leading)
    .padding()
  }
}

struct HeaderViewGenericViewBuilder<Content: View>: View {
  let title: String
  let content: Content
  
  init(
    title: String,
    @ViewBuilder content: () -> Content
  ) {
    self.title = title
    self.content = content()
  }
  
  var body: some View {
    
    VStack {
      Text(title)
        .font(.largeTitle)
        .fontWeight(.semibold)
      
      content
      
      RoundedRectangle(cornerRadius: 5)
        .frame(height: 2)
    }
    .frame(maxWidth: .infinity, alignment: .leading)
    .padding()
  }
}

struct CustomHStack<Content: View>: View {
  let content: Content
  
  init(@ViewBuilder content: () -> Content) {
    self.content = content()
  }
  
  var body: some View {
    HStack {
      content
    }
  }
  
}


struct ContentView: View {
  var body: some View {
    VStack {
      HeaderViewRegular(
        title: "New Title",
        description: "Hello",
        iconName: "heart.fill")
      
      HeaderViewRegular(
        title: "Another Title",
        description: nil, iconName: nil)
      
      HeaderViewGeneric(
        title: "Generic Title",
        content: Image(systemName: "heart.fill"))
      
      HeaderViewGeneric(
        title: "Generic Title2",
        content:
          HStack {
            Image(systemName: "heart.fill")
            Text("hello")
          })
      
      HeaderViewGenericViewBuilder(title: "ViewBuilder") {
        VStack {
          Text("hi")
          Image(systemName: "heart.fill")
        }
      }
      
      CustomHStack {
        Text("CustomHStack")
        Text("CustomHStack")
      }
      
      Spacer()
    }
  }
}

struct LocalViewBuilder: View {
  
  enum ViewType {
    case one
    case two
    case three
  }
  
  let type: ViewType
  
  var body: some View {
    VStack {
      headerSection
    }
  }
  
  @ViewBuilder private var headerSection: some View {
    
      if type == .one {
        viewOne
      } else if type == .two {
        viewTwo
      } else if type == .three {
        viewThree
      }
    
  }
  
  private var viewOne: some View {
    Text("one")
  }
  
  private var viewTwo: some View {
    Text("Two")
  }
  
  private var viewThree: some View {
    Text("three")
  }
  
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
//    ContentView()
    LocalViewBuilder(type: .two)
  }
}
