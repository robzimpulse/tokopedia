//
//  ShopTypeTableViewCell.swift
//  tokopedia
//
//  Created by Robyarta Haruli Ruci on 26/03/18.
//  Copyright © 2018 Robyarta Haruli Ruci. All rights reserved.
//

import UIKit
import Eureka

class ShopTypeTableViewCell: Cell<Bool>, CellType {

  override func setup() {
    super.setup()
  }
  
  override func update() {
    super.update()
  }
    
}

final class ShopTypeTableViewRow: Row<ShopTypeTableViewCell>, RowType {
  required init(tag: String?) {
    super.init(tag: tag)
    cellProvider = CellProvider<ShopTypeTableViewCell>(nibName: ShopTypeTableViewCell.reuseIdentifier)
    cell.height = { return UITableViewAutomaticDimension }
  }
}
