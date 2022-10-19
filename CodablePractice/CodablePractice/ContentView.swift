//
//  ContentView.swift
//  CodablePractice
//
//  Created by song on 2022/10/18.
//

import SwiftUI

struct CustomerModel: Identifiable, Codable {
  let id: String
  let name: String
  let points: Int
  let isPremium: Bool
  
  init(id: String, name: String, points: Int, isPremium: Bool) {
    self.id = id
    self.name = name
    self.points = points
    self.isPremium = isPremium
  }
  
  enum CodingKeys: CodingKey {
    case id
    case name
    case points
    case isPremium
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.id = try container.decode(String.self, forKey: .id)
    self.name = try container.decode(String.self, forKey: .name)
    self.points = try container.decode(Int.self, forKey: .points)
    self.isPremium = try container.decode(Bool.self, forKey: .isPremium)
  }
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(id, forKey: .id)
    try container.encode(name, forKey: .name)
    try container.encode(points, forKey: .points)
    try container.encode(isPremium, forKey: .isPremium)
  }
}


class CodableViewModel: ObservableObject {
  @Published var customer: CustomerModel? = CustomerModel(
    id: "2",
    name: "kim",
    points: 5,
    isPremium: true)
  @Published var customer2: CustomerModel? = nil
  
  @Published var customer3: CustomerModel? = nil
  @Published var customer4: CustomerModel? = nil
  
  init() {
    getData()
  }
  
  func getData() {
    guard let data = getJSONData() else { return }
    

    // MARK: - encoder
    
    
    
    // MARK: - decoder
    if let localData = try? JSONSerialization.jsonObject(with: data, options: []),
       let dictionary = localData as? [String: Any],
       let id = dictionary["id"] as? String,
       let name = dictionary["name"] as? String,
       let points = dictionary["points"] as? Int,
       let isPremium = dictionary["isPremium"] as? Bool
    {
      let newCustomer = CustomerModel(id: id, name: name, points: points, isPremium: isPremium)
      self.customer2 = newCustomer
    }
    
    do {
      self.customer3 = try JSONDecoder().decode(CustomerModel.self, from: data)
    } catch let error {
      print(error)
    }
    
    self.customer4 = try? JSONDecoder().decode(CustomerModel.self, from: data)
    
  }
  
  func getJSONData() -> Data? {// 데이터는 항상 가져올 수 없기 떄문에
    
    // MARK: -  encoder
    
    let customer = CustomerModel(
      id: "111",
      name: "Em",
      points: 100,
      isPremium: false)
    
    let encoderjsonData = try? JSONEncoder().encode(customer)
    
    
    
    // MARK: - decoder
    
    let dictionary: [String: Any] = [
      "id" : "1",
      "name" : "song",
      "points" : 5,
      "isPremium" : true
    ]
    
//    let jsonData = try? JSONSerialization.data(withJSONObject: dictionary, options: [])
    
    return encoderjsonData
  }
  
}

struct ContentView: View {
  
  @StateObject var vm = CodableViewModel()
  
  var body: some View {
    VStack {
      if let customer = vm.customer4 {
        Text(customer.id)
        Text(customer.name)
        Text("\(customer.points)")
        Text(customer.isPremium.description)
      }
//
//      if let customer = vm.customer2 {
//        Text(customer.id)
//        Text(customer.name)
//        Text("\(customer.points)")
//        Text(customer.isPremium.description)
//      }
//
//      if let customer = vm.customer3 {
//        Text(customer.id)
//        Text(customer.name)
//        Text("\(customer.points)")
//        Text(customer.isPremium.description)
//      }
//
//      if let customer = vm.customer4 {
//        Text(customer.id)
//        Text(customer.name)
//        Text("\(customer.points)")
//        Text(customer.isPremium.description)
//      }
      
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
