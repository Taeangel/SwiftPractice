//
//  main.swift
//  codingTestPractice
//
//  Created by song on 2023/03/04.
//

import Foundation

let play_list: [Int] = [2, 3, 1, 4]
let listen_time = 3

func solution(_ play_list:[Int], _ listen_time:Int) -> Int {
  var resultArr: [Int] = []
  let play_list = play_list
 
  var listenTimeDouble = play_list + play_list
  
  for _ in play_list {
    var result = 0
    var listenTime = listen_time
    for music in listenTimeDouble {
      if listenTime == listen_time {
        result += 1
        listenTime -= 1
      } else if listenTime > music {
        result += 1
        listenTime -= music
      } else  {
        result += 1
        break
      }
    }
 
    listenTimeDouble.reverse()
    listenTimeDouble.removeLast()
    listenTimeDouble.reverse()
    
    if result > play_list.count {
      result = play_list.count
    }
    
    resultArr.append(result)
  }
  return resultArr.max() ?? 0
}
print(solution(play_list, listen_time))
