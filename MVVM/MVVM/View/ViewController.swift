//
//  ViewController.swift
//  MVVM
//
//  Created by song on 2023/02/02.
//

import UIKit

class ViewController: UIViewController {
  
  private let viewModel: ViewModel = ViewModel()
  
  private var model: ResponseModel? {
    didSet {
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }
  }
  
  lazy var colorChangeButton: UIButton = {
    let colorChangeButton = UIButton()
    colorChangeButton.setTitle("빨간색", for: .normal)
    colorChangeButton.setTitleColor(.systemBlue, for: .normal)
    return colorChangeButton
  }()
  
  lazy var fetchButton: UIButton = {
    let fetchButton = UIButton()
    fetchButton.setTitle("요청", for: .normal)
    fetchButton.setTitleColor(.systemBlue, for: .normal)
    return fetchButton
  }()
  
  lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.delegate = self
    tableView.dataSource = self
    tableView.backgroundColor = .systemBackground
    return tableView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    viewModel.delegate = self
    
    configureUI()
  }
  
  func configureUI() {
    view.backgroundColor = .systemBackground
    view.addSubview(colorChangeButton)
    colorChangeButton.translatesAutoresizingMaskIntoConstraints = false
    colorChangeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
    colorChangeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
    colorChangeButton.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
    
    colorChangeButton.tag = 100
    
    view.addSubview(fetchButton)
    fetchButton.translatesAutoresizingMaskIntoConstraints = false
    fetchButton.topAnchor.constraint(equalTo: colorChangeButton.topAnchor).isActive = true
    fetchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
    fetchButton.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
    
    fetchButton.tag = 300
    
    view.addSubview(tableView)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.topAnchor.constraint(equalTo: colorChangeButton.bottomAnchor, constant: 20).isActive = true
    tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    self.tableView.register(MYTableViewCell.self, forCellReuseIdentifier: "cell")
  }
  // 뷰모델로 보내는 엑션은 이 함수 하나로
  @objc private func didTapButton(_ sender: UIButton) {
    viewModel.action(action: .buttonTap(sender.tag))
  }

}

extension ViewController: ViewModelDelegate {
  func updateModel(model: ResponseModel) {
    self.model = model
  }
  
  func updataError(error: Error) {
    print("에러에러 \((error as NSError).code)")
  }
  
  func buttonAction(color: ViewModel.ButtonTypeColor) {
    view.backgroundColor = UIColor(named: color.myColor)
  }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return model?.strings.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MYTableViewCell
    cell.titleLabel.text = model?.strings[indexPath.row]
    return cell
  }
}
