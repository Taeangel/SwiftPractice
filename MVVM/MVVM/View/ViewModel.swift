//
//  ViewModel.swift
//  MVVM
//
//  Created by song on 2023/02/02.
//

import Foundation

protocol ViewModelDelegate: AnyObject {
  func buttonAction(color: ViewModel.ButtonTypeColor)
  func updateModel(model: ResponseModel)
  func updata Error(error: Error)
}

class ViewModel {
  weak var delegate: ViewModelDelegate?
  
  private let service: MVVMService
  init(service: MVVMService = DefaultService()) {
    self.service = service
  }
  
  func action(action: ViewAction) {
    switch action {
    case.buttonTap(let tag):
      guard let buttonDetail = ButtonDetail(rawValue: tag) else { return }
      
      switch buttonDetail {
      case .red:
        service.callAPI { [weak self] result in
          switch result {
          case .success(let model):
            print(model)
            self?.delegate?.updateModel(model: model)
          case .failure(let error):
            self?.delegate?.updataError(error: error)
          }
        }
      case .req:
        ButtonTypeColor(rawValue: tag).flatMap { delegate?.buttonAction(color: $0) }
      }
    }
  }
}


extension ViewModel.ButtonTypeColor {
  var myColor: String {
    switch self {
    case .red:
      return "redColor"
    }
  }
}

extension ViewModel {
  enum ViewAction {
    case buttonTap(Int)
  }
  
  enum ButtonDetail: Int {
    case red = 100
    case req = 300
  }
  
  enum ButtonTypeColor: Int {
    case red = 100
  }
}
