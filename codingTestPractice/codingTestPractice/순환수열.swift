//
//  순환수열.swift
//  codingTestPractice
//
//  Created by song on 2023/03/05.
//

import Foundation


fileprivate func solution1(_ elements:[Int]) -> Int {
  
  var intArr: [Int] = []
  var element = elements
  var result: [Int] = []
  
  for _ in 0...element.count - 1 {
   let firstNum = element.removeFirst()
    element.append(firstNum)
    for i in element {
      intArr.append((intArr.last ?? 0) + i)
    }
    result += intArr
    
    intArr.removeAll()
  }
  
  return result.uniqued().count
}



extension Sequence where Element: Hashable {
  func uniqued() -> [Element] {
    var set = Set<Element>()
    return filter { set.insert($0).inserted }
  }
}

fileprivate func combi<T>(_ nums: [T], _ targetNum: Int) -> [[T]] {
  var result: [[T]] = []
  func combination(_ index: Int, _ nowCombi: [T]) {
    if nowCombi.count == targetNum {
      result.append(nowCombi)
      return
    }
    for i in index..<nums.count {
      combination(i + 1, nowCombi + [nums[i]])
    }
  }
  combination(0, [])
  return result
}
