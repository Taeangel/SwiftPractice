//
//  ViewController.swift
//  UIPractice
//
//  Created by song on 2023/03/16.
//

import UIKit

class ViewController: UIViewController {
let contentArr =  [
  "jkasdhrmqohzkrqmozhrqkmozrqhkomrqzkhomrqzhkorqmzokhrqmozrqhkomrqzhkrqmoozhkrqmozrqhkmorqzorqmzkhormqhzkrqm",
  "jkasdhrmqohzkrqmozhrqkmozrqhkomrqzkhomrqzhkorqmzokhrqmozrqhkomrqzhkrqmoozhkrqmozrqhkmorqzorqmzkhormqhzkrqm",
  "jkasdhrmqohzkrqmozhrqkmozrqhkomrqzkhomrqzhkorqmzokhrqmozrqhkomrqzhkrqmoozhkrqmozrqhkmorqzorqmzkhormqhzkrqm",
  "jkasdhrmqohzkrqmozhrqkmozrqhkomrqzkhomrqzhkorqmzokhrqmozrqhkomrqzhkrqmoozhkrqmozrqhkmorqzorqmzkhormqhzkrqm",
  "jkasdhrmqohzkrqmozhrqkmozrqhkomrqzkhomrqzhkorqmzokhrqmozrqhkomrqzhkrqmoozhkrqmozrqhkmorqzorqmzkhormqhzkrqm",
]
  
  
  @IBOutlet weak var tableView: UITableView!
  override func viewDidLoad() {
    super.viewDidLoad()
    let myTableViewCellNib = UINib(nibName: "MytableViewCell", bundle: nil)
    
    // 쎌에 리소스 등록
    self.tableView.register(myTableViewCellNib, forCellReuseIdentifier: "myTabelViewCell")
    self.tableView.rowHeight = UITableView.automaticDimension
    self.tableView.estimatedRowHeight = 120
    
    self.tableView.delegate = self
    self.tableView.dataSource = self
  }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.contentArr.count
  }
  // 각. 셀에 대한 설정
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "myTabelViewCell", for: indexPath) as! MytableViewCell
    
    cell.userContentLabel.text = contentArr[indexPath.row]
    return  cell
  }
}
