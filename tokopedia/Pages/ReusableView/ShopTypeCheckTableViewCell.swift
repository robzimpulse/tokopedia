//
//  ShopTypeCheckTableViewCell.swift
//  tokopedia
//
//  Created by Robyarta Haruli Ruci on 27/03/18.
//  Copyright © 2018 Robyarta Haruli Ruci. All rights reserved.
//

import UIKit
import Eureka

struct ShopTypeCheckModel: Equatable {
  var title: String
  var value: Bool
  static func ==(lhs: ShopTypeCheckModel, rhs: ShopTypeCheckModel) -> Bool {
    return lhs.title == rhs.title && lhs.value == rhs.value
  }
}

class ShopTypeCheckTableViewCell: Cell<ShopTypeCheckModel>, CellType {

  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var checkmarkImageView: UIImageView!
  
  override func setup() {
    super.setup()
  }
  
  override func update() {
    super.update()
    titleLabel.text = row.value?.title
    checkmarkImageView.isHidden = !(row.value?.value ?? false)
  }
  
}

final class ShopTypeCheckTableViewRow: Row<ShopTypeCheckTableViewCell>, RowType {
  required init(tag: String?) {
    super.init(tag: tag)
    cellProvider = CellProvider<ShopTypeCheckTableViewCell>(nibName: ShopTypeCheckTableViewCell.reuseIdentifier)
    cell.height = { return UITableViewAutomaticDimension }
  }
}
