//
//  SCCodingTest.swift
//  codingTestPractice
//
//  Created by song on 2023/03/14.
//

import Foundation

fileprivate let asd = [[0,2,1,3],[1,2,2,5],[3,3,4,4],[4,1,6,3],[1,6,5,7],[5,5,7,6],[5,8,6,10]]

fileprivate func solution(_ rectangles: [[Int]]) -> [String] {
  
  var downAlignmentedRects: [[Int]] = []
  var undersideBlock: [Int: Int] = [:]
  
  for rectangle in rectangles {
    var downAlignmentedRect: [Int] = []
    var underBlocks: [Int] = []
    var flatDownSide: [Int] = []
    
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
    
    flatLeftSide.removeAll()
  }
 
  return leftAlignmentedRects.map { $0.map(String.init).joined(separator: " ") }
}
//["0 0 1 1", "1 0 2 3", "2 0 3 1", "3 0 5 2", "0 3 4 4", "2 2 4 3", "4 3 5 5"]
