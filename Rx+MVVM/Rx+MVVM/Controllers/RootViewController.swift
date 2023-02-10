//
//  RootViewController.swift
//  Rx+MVVM
//
//  Created by song on 2023/02/01.
//

import UIKit
import RxSwift
import RxRelay

class RootViewController: UIViewController {

  // MARK: - Properties
  let disposeBag = DisposeBag()
  let viewModel: RootViewModel
  let articles = BehaviorRelay<[Article]>(value: [])

  private var articleViewModel = BehaviorRelay<[ArticleViewModel]>(value: [])
  
  private lazy var collectionView: UICollectionView = {
    let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
    cv.delegate = self
    cv.dataSource = self
    cv.backgroundColor = .systemBackground
    return cv
  }()
  
  var articleViewModelObserver: Observable<[ArticleViewModel]> {
    return articleViewModel.asObservable()
  }
  
  init(viewModel: RootViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    fetchArticles()
    configureUI()
    subscribe()
    configureCollectionView()
  }
  
  func configureUI() {
    view.backgroundColor = .systemBackground
    view.addSubview(collectionView)
    self.title = self.viewModel.title
    
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
  }
  
  func configureCollectionView() {
    self.collectionView.register(ArticleCell.self, forCellWithReuseIdentifier: "cell")
  }
  
  // MARK: - Helpers
  func fetchArticles() {
    viewModel.fetchArticles().subscribe { [weak self] articleViewModels in
      self?.articleViewModel.accept(articleViewModels)
    }.disposed(by: disposeBag)
  }

  func subscribe() {
    self.articleViewModelObserver.subscribe { [weak self] articles in
      DispatchQueue.main.async {
        self?.collectionView.reloadData()
      }
    }.disposed(by: disposeBag)
  }
}

extension RootViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ArticleCell
    cell.imageView.image = nil
    let articleViewModel = self.articleViewModel.value[indexPath.row]
    cell.viewModel.onNext(articleViewModel)
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.articleViewModel.value.count
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.width, height: 120)
  }
}
