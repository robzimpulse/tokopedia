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
      $0.value = PriceRangeModel(
        min: 0,
        max: 10000000,
        selectedMin: ProductCache.shared.minPrice,
        selectedMax: ProductCache.shared.maxPrice
      )
    }
  }()
  
  lazy var shopTypeRow: ShopTypeTableViewRow = {
    return ShopTypeTableViewRow("shop_type") {
      $0.onCellSelection({ [weak self] _, _ in self?.performSegue(withIdentifier: "shop", sender: self) })
    }
  }()
  
  lazy var wholeSaleRow: WholesaleTableViewRow = {
    return WholesaleTableViewRow("whole_sale") { $0.value = ProductCache.shared.wholesale }
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
    if let wholesale = form.values()["whole_sale"] as? Bool { ProductCache.shared.wholesale = wholesale }
    if let price = form.values()["range_price"] as? PriceRangeModel { ProductCache.shared.minPrice = price.selectedMin }
    if let price = form.values()["range_price"] as? PriceRangeModel { ProductCache.shared.maxPrice = price.selectedMax }
    ProductCache.shared.resetProduct()
    ProductCache.shared.nextProduct()
    back(self)
  }
  
  @IBAction func reset(_ sender: Any) {
    priceRangeRow.value = PriceRangeModel(min: 0, max: 10000000, selectedMin: 0, selectedMax: 10000000)
    wholeSaleRow.value = false
    priceRangeRow.reload()
    wholeSaleRow.reload()
  }
  
}
