//
//  조합.swift
//  codingTestPractice
//
//  Created by song on 2023/03/04.
//

import Foundation

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


fileprivate func permute<T>(_ nums: [T], _ targetNum: Int) -> [[T]] {
  var result = [[T]]()
  var visited = [Bool](repeating: false, count: nums.count)
  
  func permutation(_ nowPermute: [T]) {
    if nowPermute.count == targetNum {
      result.append(nowPermute)
      return
    }
    for i in 0..<nums.count {
      if visited[i] == true {
        continue
      }
      else {
        visited[i] = true
        permutation(nowPermute + [nums[i]])
        visited[i] = false
      }
    }
  }
  permutation([])
  
  return result
}
