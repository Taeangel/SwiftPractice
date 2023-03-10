//
//  main.swift
//  codingTestPractice
//
//  Created by song on 2023/03/04.
//

import Foundation
//
//let height = [140, 21 , 21 , 32]
//let width =  [  2,  1,   3,   7]
//
//func solution(_ height: [Int], _ width: [Int]) -> Int64 {
//
//  let bookZip = zip(height, width)
//  let sortedBook = bookZip.sorted { $0.0 > $1.0 }
//
//  var bookWidth = 0
//  var bookHeight = 0
//  var area: [Int] = []
//
//  for book in sortedBook {
//    bookWidth += book.1
//    bookHeight = book.0
//    let totalArea = bookWidth * bookHeight
//    area.append(totalArea)
//  }
//
//  return Int64(area.max()!)
//}
//
//
//print(solution(height, width))

let asd = [[0,2,1,3],[1,2,2,5],[3,3,4,4],[4,1,6,3],[1,6,5,7],[5,5,7,6],[5,8,6,10]]

func solution(_ rectangles: [[Int]]) -> [String] {
  
  var downAlignmentedRects: [[Int]] = []
  var undersideBlock: [Int: Int] = [:]
  
  for rectangle in rectangles {
    var downAlignmentedRect: [Int] = []
    var underBlocks: [Int] = []
    var flatDownSide:[Int] = []
    
    for under in stride(from: rectangle[0], to: rectangle[2], by: 1) {
      underBlocks.append(undersideBlock[under] ?? 0)
      flatDownSide = []
    }
    
    let heightest = underBlocks.max() ?? 0
    let downCount = rectangle[1] - heightest
    
    downAlignmentedRect.append(rectangle[0])
    downAlignmentedRect.append(rectangle[1] - downCount)
    downAlignmentedRect.append(rectangle[2])
    downAlignmentedRect.append(rectangle[3] - downCount)
    
    downAlignmentedRects.append(downAlignmentedRect)
    
    for under in stride(from: rectangle[0], to: rectangle[2] , by: 1) {
      let undersideBlockCount = undersideBlock[under] ?? 0
      undersideBlock[under] = undersideBlockCount + rectangle[3] - rectangle[1]
      flatDownSide.append(undersideBlock[under] ?? 0)
    }
    
    for under in stride(from: rectangle[0], to: rectangle[2] , by: 1) {
      undersideBlock[under] = flatDownSide.max() ?? 0
    }
  }
  
  var leftAlignmentedRects: [[Int]] = []
  var leftSideBlock: [Int: Int] = [:]
  
  for rectangle in downAlignmentedRects {
    
    var leftAliRect: [Int] = []
    var leftBlocks: [Int] = []
    var flatLeftSide:[Int] = []
    
    for left in stride(from: rectangle[1], to: rectangle[3], by: 1) {
      leftBlocks.append(leftSideBlock[left] ?? 0)
      flatLeftSide = []
    }
    
    let widthest = leftBlocks.max() ?? 0
    let leftCount = rectangle[0] - widthest
    
    leftAliRect.append(rectangle[0] - leftCount)
    leftAliRect.append(rectangle[1])
    leftAliRect.append(rectangle[2] - leftCount)
    leftAliRect.append(rectangle[3])
    
    leftAlignmentedRects.append(leftAliRect)
    
    for left in stride(from: rectangle[1], to: rectangle[3] , by: 1) {
      let leftsideBlockCount = leftSideBlock[left] ?? 0
      leftSideBlock[left] = leftsideBlockCount + rectangle[2] - rectangle[0]
      flatLeftSide.append(leftSideBlock[left] ?? 0)
    }
    
    for left in stride(from: rectangle[1], to: rectangle[3] , by: 1) {
      leftSideBlock[left] = flatLeftSide.max() ?? 0
    }
  }
 
  return leftAlignmentedRects.map { $0.map(String.init).joined(separator: " ") }
}

print(solution(asd))

//var downAliRects: [[Int]] = []
//var undersideBlock: [Int: Int] = [:]
//
//for rectangle in rectangles {
//  var downAliRect: [Int] = []
//  var underBlocks: [Int] = []
//  for under in stride(from: rectangle[0], to: rectangle[1], by: 1) {
//    underBlocks.append(undersideBlock[under] ?? 0)
//  }
//
//  let heightest = underBlocks.max() ?? 0 // 이친구가 현상황에 밑면임
//  let downCount = rectangle[1] - heightest
//
//  downAliRect.append(rectangle[0])
//  downAliRect.append(rectangle[1] - downCount)
//  downAliRect.append(rectangle[2])
//  downAliRect.append(rectangle[3] - downCount)
//
//  downAliRects.append(downAliRect)
//
//  for under in stride(from: rectangle[0], to: rectangle[2] , by: 1) {
//    print(under)
//    let undersideBlockCount = undersideBlock[under] ?? 0
//    undersideBlock[under] = undersideBlockCount + rectangle[3] - rectangle[1]
//  }
//}



//
//print(solution(asd))
//
//let n = 8
//let m = 4
//let section = [2, 3, 6]
//
//func solution(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
//  var leftAli: Int
//  var result: Int = 0
//  var sece = section
//
//  while sece.count != 0 {
//    leftAli = sece.min()!
//
//    result += 1
//  }
//  return result
//}

//print(solution(n, m, section))
