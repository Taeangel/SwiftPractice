//
//  ProtocolOrientPrograming.swift
//  protocolsPractice
//
//  Created by song on 2022/10/07.
//

import UIKit

class Vehicle {
  let name: String
  let numberOfWheels: Int
  let fuelTankSize: Int
  let fueIConsumtion: Int
  
  init(
  name: String,
  numberOfWheels: Int,
  fuelTankSize: Int,
  fueIConsumtion: Int
  ) {
    self.name = name
    self.numberOfWheels = numberOfWheels
    self.fuelTankSize = fuelTankSize
    self.fueIConsumtion = fueIConsumtion
  }
  
  var longertTravelDistance: Int {
    return self.fuelTankSize / self.fueIConsumtion * 100
  }
  
  var info: String {
    return "\(self.name) can travel \(self.longertTravelDistance) km"
  }
  
}
 
let honda = Vehicle(name: "Honda", numberOfWheels: 4, fuelTankSize: 50, fueIConsumtion: 6)
let f150Xlt = Vehicle(name: "F150=XLT", numberOfWheels: 4, fuelTankSize: 80, fueIConsumtion: 11)
let helicopter = Vehicle(name: "Bell-429", numberOfWheels: 0, fuelTankSize: 900, fueIConsumtion: 20)

