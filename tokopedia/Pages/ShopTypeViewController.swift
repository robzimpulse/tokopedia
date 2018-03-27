//
//  ShopTypeViewController.swift
//  tokopedia
//
//  Created by Robyarta Haruli Ruci on 27/03/18.
//  Copyright © 2018 Robyarta Haruli Ruci. All rights reserved.
//

import UIKit
import Eureka

class ShopTypeViewController: FormViewController {

  lazy var officialRow: ShopTypeCheckTableViewRow = {
    return ShopTypeCheckTableViewRow("official") {
      $0.value = ShopTypeCheckModel(title: "Official Store", value: ProductCache.shared.official ?? false)
      $0.onCellSelection({ _, row in
        row.value?.value = !(row.value?.value ?? false)
        row.updateCell()
      })
    }
  }()
  
  lazy var goldMerchantRow: ShopTypeCheckTableViewRow = {
    return ShopTypeCheckTableViewRow("gold_merchant") {
      $0.value = ShopTypeCheckModel(title: "Gold Merchant", value: ProductCache.shared.fshop == 2)
      $0.onCellSelection({ _, row in
        row.value?.value = !(row.value?.value ?? false)
        row.updateCell()
      })
    }
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.tableFooterView = UIView()
    
    form +++ Section()
      <<< goldMerchantRow
      <<< officialRow
    
  }
  
  @IBAction func reset(_ sender: Any){
    officialRow.value?.value = false
    goldMerchantRow.value?.value = false
    officialRow.reload()
    goldMerchantRow.reload()
  }
  
  @IBAction func apply(_ sender: Any){
    ProductCache.shared.official = (form.values()["official"] as? ShopTypeCheckModel)?.value
    ProductCache.shared.fshop = ((form.values()["gold_merchant"] as? ShopTypeCheckModel)?.value ?? false ) ? 2 : nil
    back(self)
  }

}
