//
//  FilterViewController.swift
//  tokopedia
//
//  Created by Robyarta Haruli Ruci on 26/03/18.
//  Copyright © 2018 Robyarta Haruli Ruci. All rights reserved.
//

import UIKit
import Eureka

class FilterViewController: FormViewController {
  
  lazy var priceRangeRow: PriceRangeTableViewRow = {
    return PriceRangeTableViewRow("range_price") {
      $0.value = PriceRangeModel(min: 0, max: 80000000)
    }
  }()
  
  lazy var shopTypeRow: ShopTypeTableViewRow = {
    return ShopTypeTableViewRow("shop_type") {
      $0.onCellSelection({ [weak self] _, _ in self?.performSegue(withIdentifier: "shop", sender: self) })
    }
  }()
  
  lazy var wholeSaleRow: WholesaleTableViewRow = {
    return WholesaleTableViewRow("whole_sale")
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.tableFooterView = UIView()
    tableView.separatorColor = .white
    
    form
      +++ Section()
      <<< priceRangeRow
      <<< wholeSaleRow
      
      +++ Section()
      <<< shopTypeRow
    
  }
  
  @IBAction func apply(_ sender: Any) {
    print(form.values())
  }
  
  @IBAction func reset(_ sender: Any) {
    priceRangeRow.value = PriceRangeModel(min: 0, max: 80000000)
    wholeSaleRow.value = false
    priceRangeRow.reload()
    wholeSaleRow.reload()
  }
  
}
