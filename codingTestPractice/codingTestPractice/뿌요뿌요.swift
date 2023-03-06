//
//  뿌요뿌요.swift
//  codingTestPractice
//
//  Created by song on 2023/03/04.
//

import Foundation

fileprivate func solution(_ s : inout String) -> Int {
 
  var result = 0
  var arr: [Character] = []
  
  for str in s {
    if arr.last == str {
      arr.removeLast()
    } else {
      arr.append(str)
    }
  }
  
  result = arr.count == 0 ? 1 : 0
  return result
  
}

