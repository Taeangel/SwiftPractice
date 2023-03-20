//
//  MyTableViewCell.swift
//  UIPractice
//
//  Created by song on 2023/03/16.
//

import Foundation
import UIKit

class MytableViewCell: UITableViewCell {
  @IBOutlet weak var profileImage: UIImageView!
  //쌜이 렌더링(그릴떄)
  @IBOutlet weak var user: UILabel!
  
  @IBOutlet weak var userContentLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    print("cell  생성")
    profileImage.layer.cornerRadius = profileImage.frame.width / 2
  }
}
