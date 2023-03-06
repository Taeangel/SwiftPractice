//
//  main.swift
//  codingTestPractice
//
//  Created by song on 2023/03/04.
//

import Foundation


func solution(_ sequence:[Int]) -> Int64 {
  
  var arr: [Int] = []
  var arr2: [Int] = []
  var sequ = sequence
  var result: [Int] = []
  for _ in 0...sequ.count - 1 {
    for i in sequ.indices {
      
      if i % 2 == 0 {
        arr.append((arr.last ?? 0) + sequ[i] * -1)
      } else {
        arr.append((arr.last ?? 0) + sequ[i])
      }
      
      if i % 2 != 0 {
        arr2.append((arr2.last ?? 0) + sequ[i] * -1)
      } else {
        arr2.append((arr2.last ?? 0) + sequ[i])
      }
      
    }
    result += arr
    result += arr2
    arr.removeAll()
    arr2.removeAll()
    sequ.reverse()
    sequ.removeLast()
    sequ.reverse()
  }
  return Int64(result.max()!)
}

print(solution([2, 3, -6, 1, 3, -1, 2, 4]))
