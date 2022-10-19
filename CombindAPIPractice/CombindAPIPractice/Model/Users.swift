//
//  File.swift
//  CombindAPIPractice
//
//  Created by song on 2022/10/18.
//

import Foundation


struct Address {
  let street: String
  let suite: String
  let city: String
  let zipcode: String
  let geo: Geo
}

struct Geo {
  let lat: String
  let lng: String
}

