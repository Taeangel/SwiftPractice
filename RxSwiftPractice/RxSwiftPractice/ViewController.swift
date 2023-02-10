//
//  ViewController.swift
//  RxSwiftPractice
//
//  Created by song on 2023/02/04.
//

import UIKit
import RxSwift
let MEMBER_LIST_URL = "https://my.api.mockaroo.com/members_with_avatar.json?key=44ce18f0"

class ViewController: UIViewController {
  lazy var text: UILabel = {
    let text = UILabel()
    text.text = "cjdma"
    text.textColor = .black
    text.font = .preferredFont(forTextStyle: .callout, compatibleWith: .current)
    text.numberOfLines = 0
    text.sizeToFit()
    return text
  }()
  
  lazy var downloadButton: UIButton = {
    let button = UIButton()
    button.setTitle("눌러", for: .normal)
    button.setTitleColor(.systemBlue, for: .normal)
    return button
  }()
  
  lazy var zipButton: UIButton = {
    let button = UIButton()
    button.setTitle("zip", for: .normal)
    button.setTitleColor(.systemBlue, for: .normal) 
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
  }
  
  func configureUI() {
    view.backgroundColor = .systemBackground
    view.addSubview(text)
    text.translatesAutoresizingMaskIntoConstraints = false
    text.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
    text .leftAnchor.constraint(equalTo: view.leftAnchor,constant: 30).isActive = true
    
    view.addSubview(downloadButton)
    downloadButton.translatesAutoresizingMaskIntoConstraints = false
    downloadButton.topAnchor.constraint(equalTo: text.topAnchor).isActive = true
    downloadButton.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -30).isActive = true
    downloadButton.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
    
    view.addSubview(zipButton)
    zipButton.translatesAutoresizingMaskIntoConstraints = false
    zipButton.topAnchor.constraint(equalTo: text.bottomAnchor).isActive = true
    zipButton.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 30).isActive = true
    zipButton.addTarget(self, action: #selector(didtapZipButton(_:)), for: .touchUpInside)
  }
  
  var disposeBag = DisposeBag()
  
  func firstObservable(_ url: String) -> Observable<String> {
    return Observable.just("Hello World")
//    데이터를 한번 보낼때 사용합니다
//    return Observable.from(["Hello", "world"])
    //배열데이터를 연쇄적으로 보낼때 사용합니다.
//    return Observable.create { emitter in
//      emitter.onNext("Hello World")
//      emitter.onCompleted()
//      return Disposables.create()
//    }
    
  }
  
  
  //Observable의 생명주기
  //1 create
  //2 subscribe
  //3 onNext
  //4 onComplete / onError
  //5 dispose

  
  @objc func didTapButton(_ sender: UIButton) {
//    downloadJson(MEMBER_LIST_URL)
//      .subscribe { event in
//        switch event {
//        case let .next(전달값):
//          DispatchQueue.main.async {
//            self.text.text = 전달값
//          }
//        default:
//          break
//        }
//      }
    // 위와 같이 처리하면 귀차나ㅠㅠ
    
    firstObservable("하잇")
      .observe(on: MainScheduler.instance)
      .subscribe(on: ConcurrentDispatchQueueScheduler(qos: .default)) // 위치는 상관이 없다
      .subscribe { self.text.text = $0 }
      .disposed(by: disposeBag)
  }
  
  func newObservable() -> Observable<String> {
    return Observable.just("새로운옵저버블")
  }
  
  @objc func didtapZipButton(_ sender: UIButton) {
    let firstObservable = firstObservable("")
    let secondObservavle = newObservable()
    
    Observable.zip(firstObservable, secondObservavle)
      .map { $0 + "\n" + $1 }
      .subscribe { self.text.text = $0 }
      .disposed(by: disposeBag)
  }
}

