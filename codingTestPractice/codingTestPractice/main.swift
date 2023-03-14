//
//  main.swift
//  codingTestPractice
//
//  Created by song on 2023/03/04.
//

import Foundation


let regularExpression = "asdfeq123_@hackerrank.com"


func  isCorrect(regularExpression: String) -> Bool {
  var result: Bool = true
  var regularExpressionArr: [String] = []
  var smallLetter: String = ""
  var number: String = ""
  
  regularExpressionArr = regularExpression.components(separatedBy: ["_", "@"])

  if regularExpressionArr.count == 3 {
    
    smallLetter = regularExpressionArr[0]
    number = regularExpressionArr[1]
  } else if regularExpressionArr.count == 2 {

    smallLetter = regularExpressionArr[0]
    number = smallLetter.filter { $0.isNumber }
    for _ in 0...number.count  {
      smallLetter.removeLast()
    }
    
  } else {
    return false
  }
  
  let email = regularExpressionArr.last!
  
  let sda = smallLetter.filter { $0.isNumber }
  
  if sda.count != 0 {
    result = false
  }
  
  if smallLetter.lowercased() != smallLetter {
    result = false
  }
  
  if smallLetter.count > 6 {
    result = false
  }
  
  if number.count > 4 {
    result = false
  }
  
  if email != "hackerrank.com"  {
    result = false
  }
  
  
  return result
}

print(isCorrect(regularExpression: regularExpression))

//let keymap: [String] = ["ABACD", "BCEFD"]
//
//let targets: [String] = ["ABCD", "AABB"]
//
//
//
//func solution(_ keymap:[String], _ targets:[String]) -> [Int] {
//  var keymap = keymap.map{$0.map{String($0)}}
//  var result = [Int]()
//  var sum = 0
//
//  for target in targets {
//    print(target.map { String($0) })
//    sum = 0
//    for t in target.map { String($0) } {
//
//      var minValue = Int.max
//      for k in keymap{
//        if let i = k.firstIndex(of: t) {
//          minValue = i+1
//        }
//      }
//      sum = minValue == Int.max ? 0 : sum+minValue
//    }
//    result.append(sum == 0 ? -1 : sum)
//  }
//
//  return result
//}
////[9, 4]
//print(solution(keymap, targets))
