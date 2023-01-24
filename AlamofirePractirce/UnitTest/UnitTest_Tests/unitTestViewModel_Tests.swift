//
//  unitTestViewModel_Tests.swift
//  UnitTest_Tests
//
//  Created by song on 2022/12/30.
//

import XCTest
@testable import UnitTest

// Naming Structure: test_UnitOfWork_StateUnderTest_ExpectedBehavior
// Naming Structure: test_[struct or class]_[variable or [function]_[expected result]

// Testing Structure: Given When Then

final class unitTestViewModel_Tests: XCTestCase {
  
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
 
  func test_UnitTestViewModel_isPremium_sholdBeTrue() {
    // given
    let userIsPremium: Bool = true
    
    // when
    let vm = UnitTestViewModel(isPremium: userIsPremium)
    
    // then
    XCTAssertTrue(vm.isPremium)
    
  }
  
//  func test_UnitTestViewModel_isPremium_sholdBeTrue() {
//    // given
//    let userIsPremium: Bool = true
//    
//    // when
//    let vm = UnitTestViewModel(isPremium: userIsPremium)
//    
//    // then
//    XCTAssertTrue(vm.isPremium)
//    
//  }
//
//  func test_UnitTestViewModel_isPremium_sholdBeFalse() {
//    // given
//    let userIsPremium: Bool = false
//
//    // when
//    let vm = UnitTestViewModel(isPremium: userIsPremium)
//
//    // then
//    XCTAssertFalse(vm.isPremium)
//  }
//
//  func test_UnitTestViewModel_isPremium_sholdBeInjectedValue() {
//    // given
//    let userIsPremium: Bool = Bool.random()
//
//    // when
//    let vm = UnitTestViewModel(isPremium: userIsPremium)
//
//    // then
//    XCTAssertEqual(userIsPremium, vm.isPremium)
//  }
//
//  func test_UnitTestViewModel_isPremium_sholdBeInjectedValue_stress() {
//    for _ in 0..<100 {
//      // given
//      let userIsPremium: Bool = Bool.random()
//
//      // when
//      let vm = UnitTestViewModel(isPremium: userIsPremium)
//
//      // then
//      XCTAssertEqual(userIsPremium, vm.isPremium)
//    }
//  }
//
//  func test_UnitTestViewModel_dataArray_sholdBeEmpty() {
//    // given
//    let userIsPremium: Bool = Bool.random()
//
//    // when
//    let vm = UnitTestViewModel(isPremium: userIsPremium)
//
//    // then
//    XCTAssertTrue(vm.dataArray.isEmpty)
//    XCTAssertEqual(vm.dataArray.count, 0)
//  }
//  func test_UnitTestViewModel_dataArray_sholdAddItems() {
//    // given
//    let vm = UnitTestViewModel(isPremium: Bool.random())
//
//    // when
//    vm.addItem(item: "123")
//
//    // then
//    XCTAssertTrue(!vm.dataArray.isEmpty)
//    XCTAssertFalse(vm.dataArray.isEmpty)
//    XCTAssertEqual(vm.dataArray.count, 1)
//    XCTAssertNotEqual(vm.dataArray.count, 0)
//    XCTAssertGreaterThan(vm.dataArray.count, 0)
////    XCTAssertGreaterThanOrEqual(<#T##expression1: Comparable##Comparable#>, <#T##expression2: Comparable##Comparable#>)
////    XCTAssertLessThan(<#T##expression1: Comparable##Comparable#>, <#T##expression2: Comparable##Comparable#>)
//
//  }
//
//  func test_UnitTestViewModel_dataArray_sholdNotAddBlankString() {
//    // given
//    let vm = UnitTestViewModel(isPremium: Bool.random())
//
//    // when
//    vm.addItem(item: "")
//
//    // then
//    XCTAssertTrue(vm.dataArray.isEmpty)
//  }
}
