//
//  같은문자수대로쪼개기.swift
//  codingTestPractice
//
//  Created by song on 2023/03/04.
//

import Foundation

fileprivate func solution(_ s:String) -> Int {
  
  var firstString: Character = " "
  var firstStringCount = 0
  var otherStringCount = 0
  var totalCount = s.count
  var result = 0
  
  for i in s {
    
    if firstString == " " {
      firstString = i
      firstStringCount += 1
    } else if i == firstString {
      firstStringCount += 1
    } else {
      otherStringCount += 1
    }

    if firstStringCount == otherStringCount {
      result += 1
      firstString = " "
      totalCount -= firstStringCount * 2
      firstStringCount = 0
      otherStringCount = 0
    }
  }

  if totalCount == 0 {
    return result
  } else {
    return result + 1
  }
}
