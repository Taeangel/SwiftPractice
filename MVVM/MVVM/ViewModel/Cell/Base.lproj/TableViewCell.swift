//
//  TableViewCell.swift
//  MVVM
//
//  Created by song on 2023/02/02.
//

import UIKit

class MYTableViewCell: UITableViewCell {
  
  lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.text = "asdakljaskl"
    label.widthAnchor.constraint(equalToConstant:  100).isActive = true
    label.backgroundColor = .systemBackground
    return label
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    configureUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
    configureUI()
  }
  
  func configureUI() {
    backgroundColor = .systemBackground
    addSubview(titleLabel)
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
  }
  
}
