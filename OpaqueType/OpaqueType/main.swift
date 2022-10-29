//
//  main.swift
//  OpaqueType
//
//  Created by song on 2022/10/27.
//

import Foundation

enum CardType {
  case gold
  case platinum
}

protocol CardNumberProtocol { }


protocol Card {
  
  associatedtype CardNumber: CardNumberProtocol
  
  var type: CardType { get set }
  var limit: Int { get set }
  var number: String { get set }
  
  func validateCardNumber(number: CardNumber)
}

struct VisaCard: Card {
  typealias CardNumber = CardNumberProtocol
  var type: CardType = .gold
  var limit: Int = 3000
  var number: String = "4141"
  func validateCardNumber(number: String) {
    
  }
}

struct MasterCard: Card {
  typealias CardNumber = CardNumberProtocol
  var type: CardType = .gold
  var limit: Int = 3000
  var number: String = "4141"
  func validateCardNumber(number: String) {
    
  }
}
