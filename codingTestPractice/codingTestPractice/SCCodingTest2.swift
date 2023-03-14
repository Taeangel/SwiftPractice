//
//  SCCodingTest2.swift
//  codingTestPractice
//
//  Created by song on 2023/03/14.
//

import Foundation

fileprivate let height = [140, 21 , 21 , 32]
fileprivate let width =  [  2,  1,   3,   7]

fileprivate func solution(_ height: [Int], _ width: [Int]) -> Int64 {

  let bookZip = zip(height, width)
  let sortedBook = bookZip.sorted { $0.0 > $1.0 }

  var bookWidth = 0
  var bookHeight = 0
  var area: [Int] = []

  for book in sortedBook {
    bookWidth += book.1
    bookHeight = book.0
    let totalArea = bookWidth * bookHeight
    area.append(totalArea)
  }

  return Int64(area.max()!)
}
