//
//  RandomUser+Response.swift
//  AlamofirePractirce
//
//  Created by song on 2022/11/05.
//

import Foundation

struct RandomUserRespons: Codable, CustomStringConvertible {
  var results: [RandomUser]
  var info: Info
  
  var description: String {
    return "result.count: \(results.count) / info: \(info.seed)" 
  }

}

struct RandomUser: Codable, Identifiable, CustomStringConvertible {
  var id = UUID()
  var name: Name
  var photo: Photo
  
  private enum CodingKeys: String, CodingKey {
    case name = "name"
    case photo = "picture"
  }
  static func getDummy() -> Self {
    return RandomUser(name:  Name.getDummy(),photo: Photo.getDummy() )
  }
  
  var profileImageUrl: URL {
    get {
      URL(string: photo.medium)!
    }
  }
  
  var description: String {
    return name.description
  }
}

struct Name: Codable, CustomStringConvertible {
  var title: String
  var first: String
  var last: String
  
  var description: String {
    return "[\(title)] \(last), \(first)"
  }
  
  static func getDummy() -> Self {
    return Name(title: "더미", first: "데이터", last: "입니다.")
  }
}

struct Photo: Codable {
  var large: String
  var medium: String
  var thumbnail: String
  static func getDummy() -> Self {
    return Photo(
      large: "https://randomuser.me/api/portraits/women/71.jpg",
      medium: "https://randomuser.me/api/portraits/med/women/71.jpg",
      thumbnail: "https://randomuser.me/api/portraits/thumb/women/71.jpg")
  }
}

struct Info: Codable {
  var seed: String
  var resultCount: Int
  var page: Int
  var version: String
  
  private enum CodingKeys: String, CodingKey {
    case seed = "seed"
    case resultCount = "results"
    case page = "page"
    case version = "version"
  }
}




//"gender": "male",
//"name": {
//    "title": "Mr",
//    "first": "Nazario",
//    "last": "Vergara"
//},
//"location": {
//    "street": {
//        "number": 4214,
//        "name": "Diagonal Nuevo León"
//    },
//    "city": "Tecolotlán",
//    "state": "Tabasco",
//    "country": "Mexico",
//    "postcode": 75498,
//    "coordinates": {
//        "latitude": "28.6797",
//        "longitude": "-39.8552"
//    },
//    "timezone": {
//        "offset": "+1:00",
//        "description": "Brussels, Copenhagen, Madrid, Paris"
//    }
//},
//"email": "nazario.vergara@example.com",
//"login": {
//    "uuid": "bf769ddb-67e7-4727-8a75-8792091a6644",
//    "username": "lazygoose560",
//    "password": "older",
//    "salt": "zB3EBkBH",
//    "md5": "6b819e55edb48ef4a372cc98cf5e0927",
//    "sha1": "5992e8f7836681bb4b5dc86a0b1336e81fc54de1",
//    "sha256": "3accc1bc268d2f78ff774c437398753ae1a08eaf2ff00143bdbb774d2fffa7bf"
//},
//"dob": {
//    "date": "1969-09-17T10:37:08.599Z",
//    "age": 53
//},
//"registered": {
//    "date": "2014-07-09T13:47:03.035Z",
//    "age": 8
//},
//"phone": "(605) 164 4228",
//"cell": "(673) 000 2414",
//"id": {
//    "name": "NSS",
//    "value": "17 18 77 3809 1"
//},
//"picture": {
//    "large": "https://randomuser.me/api/portraits/men/15.jpg",
//    "medium": "https://randomuser.me/api/portraits/med/men/15.jpg",
//    "thumbnail": "https://randomuser.me/api/portraits/thumb/men/15.jpg"
//},
//"nat": "MX"
