//
//  ContentView.swift
//  GenericsPractice
//
//  Created by song on 2022/10/11.
//

import SwiftUI

struct StringModel {
  let info: String?
  
  func removeInfo() -> StringModel {
    return StringModel(info: nil)
  }
}

struct BoolModel {
  let info: Bool?
  
  func removeInfo() -> BoolModel {
    return BoolModel(info: nil)
  }
}

struct GenericModel<CustomType> {
  let infof: CustomType?
  
  func removeInfo() -> GenericModel {
    GenericModel(infof: nil)
  }
}

struct GenericView<CustomType: View>: View {
  
  let content: CustomType
  let title: String
  
  var body: some View {
    
    VStack {
      Text(title)
      content
    }
  }
  
  
}


class GenericsViewModel: ObservableObject {
  @Published var stringModel = StringModel(info: "Hello, world")
  @Published var boolModel = BoolModel(info: true)
  @Published var genericStringModel = GenericModel(infof: "Hello Generic")
  @Published var genericBoolModel = GenericModel(infof: true)
  func removeData() {
    stringModel = stringModel.removeInfo()
    boolModel = boolModel.removeInfo()
    genericStringModel = genericStringModel.removeInfo()
    genericBoolModel = genericBoolModel.removeInfo()
  }
  
}

struct ContentView: View {
  
  @StateObject var vm = GenericsViewModel()
  var body: some View {
    VStack {
      GenericView(content: Text("custom content"), title: "new view!")
      
      Text(vm.stringModel.info ?? "no data" )
      
      
      Text(vm.boolModel.info?.description ?? "no data")
    }
    .onTapGesture {
      vm.removeData()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
