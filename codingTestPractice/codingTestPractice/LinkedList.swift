//
//  LinkedList.swift
//  codingTestPractice
//
//  Created by song on 2023/03/04.
//

import Foundation

class Node<T>{
  
  var prev: Node<T>?
  var next: Node<T>?
  var data: T?
  
  init(data: T?){
    self.prev = nil
    self.next = nil
    self.data = data
  }
}

class LinkedList<T: Equatable>{
  
  var head:Node<T>?
  var tail:Node<T>?
  
//  init(head: Node<T>?){
//    self.head = head
//    self.tail = head
//  }
  
  //리스트 비어있는 지 판별
  func isEmpty() -> Bool {
    return head == nil
  }
  
  //맨 끝에 노드 추가
  func append(node: Node<T>) {
    if isEmpty() {
      head = node
      tail = node
    } else {
      tail!.next = node
      node.prev = tail
      tail = node
    }
  }
  
  //입력받은 데이터를 가진 노드 검색.
  func search(data: T) -> Node<T> {
    var curr: Node<T> = self.head!
    while curr.next != nil {
      if curr.data == data {
        return curr
      }
      curr = curr.next!
    }
    return curr
  }
  
  //입력받은 인덱스값에 해당하는 노드 검색
  func search(index: Int) -> Node<T>? {
    var curr:Node<T> = head!
    if (index != -1) {
      for _ in 0..<index {
        if curr.next == nil{
          return nil
        } else {
          curr = curr.next!
        }
      }
    } else {
      return nil
    }
    return curr
  }
  
  //리스트 사이즈 도출
  func size() -> Int {
    if(isEmpty()){
      return 0
    } else {
      var size:Int = 1
      var curr: Node<T> = self.head!
      while curr.next != nil{
        size += 1
        curr = curr.next!
      }
      return size
    }
  }
  
  //원하는 인덱스에 노드 추가
  func insert(node: Node<T>, index: Int) {
    if(head == nil){
      head = node
      tail = node
      return
    }
    
    guard let prevTemp = search(index: index-1) else {
      node.next = head
      head = node
      return
    }
    
    guard let nextTemp = prevTemp.next else {
      prevTemp.next = node
      tail = node
      return
    }
    
    node.next = nextTemp
    prevTemp.next = node
  }
  
  //파라미터로 받는 데이터를 포함하는 노드 삭제
  func remove(data: T) {
    let nodeToBeRemoved: Node<T> = search(data: data)
    if nodeToBeRemoved.data == head!.data {
      self.head = head!.next
      head!.prev = nil
      return
    } else if nodeToBeRemoved.data == tail!.data {
      self.tail = tail!.prev
      tail!.next = nil
      return
    }
    
    let prev: Node<T> = nodeToBeRemoved.prev!
    let next: Node<T> = nodeToBeRemoved.next!
    prev.next = next
    next.prev = prev
    
    nodeToBeRemoved.prev = nil
    nodeToBeRemoved.next = nil
  }
}

