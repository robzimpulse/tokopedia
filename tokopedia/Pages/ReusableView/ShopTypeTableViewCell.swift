//
//  ShopTypeTableViewCell.swift
//  tokopedia
//
//  Created by Robyarta Haruli Ruci on 26/03/18.
//  Copyright © 2018 Robyarta Haruli Ruci. All rights reserved.
//

import UIKit
import Eureka
import TagListView

struct ShopTypeModel: Equatable {
  var isGoldMerchant: Bool?
  var isOfficial: Bool?
  static func ==(lhs: ShopTypeModel, rhs: ShopTypeModel) -> Bool {
    return lhs.isOfficial == rhs.isOfficial && lhs.isGoldMerchant == rhs.isGoldMerchant
  }
}

class ShopTypeTableViewCell: Cell<ShopTypeModel>, CellType, TagListViewDelegate {

  @IBOutlet weak var tagView: TagListView!
  
  override func setup() {
    super.setup()
    tagView.delegate = self
  }
  
  override func update() {
    super.update()
    tagView.removeAllTags()
    if row.value?.isGoldMerchant ?? false { tagView.addTag("Gold Merchant") }
    if row.value?.isOfficial ?? false { tagView.addTag("Official") }
  }
  
  func tagRemoveButtonPressed(_ title: String, tagView: TagView, sender: TagListView) {
    
    if title == "Gold Merchant" { row.value?.isGoldMerchant = nil }
    else if title == "Official" { row.value?.isOfficial = nil }
    row.reload()
  }
  
}

final class ShopTypeTableViewRow: Row<ShopTypeTableViewCell>, RowType {
  required init(tag: String?) {
    super.init(tag: tag)
    cellProvider = CellProvider<ShopTypeTableViewCell>(nibName: ShopTypeTableViewCell.reuseIdentifier)
    cell.height = { return UITableViewAutomaticDimension }
  }
}
