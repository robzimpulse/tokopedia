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
        selectedMin: ProductCache.shared.minPrice ?? 0,
        selectedMax: ProductCache.shared.maxPrice ?? 10000000
      )
    }
  }()
  
  lazy var shopTypeRow: ShopTypeTableViewRow = {
    return ShopTypeTableViewRow("shop_type") {
      $0.onCellSelection({ [weak self] _, _ in self?.performSegue(withIdentifier: "shop", sender: self) })
      $0.value = ShopTypeModel(
        isGoldMerchant: ProductCache.shared.fshop == 2,
        isOfficial: ProductCache.shared.official
      )
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
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    shopTypeRow.value = ShopTypeModel(
      isGoldMerchant: ProductCache.shared.fshop == 2,
      isOfficial: ProductCache.shared.official
    )
    shopTypeRow.reload()
  }
  
  @IBAction func apply(_ sender: Any) {
    ProductCache.shared.wholesale = form.values()["whole_sale"] as? Bool
    ProductCache.shared.minPrice = (form.values()["range_price"] as? PriceRangeModel)?.selectedMin
    ProductCache.shared.maxPrice = (form.values()["range_price"] as? PriceRangeModel)?.selectedMax
    ProductCache.shared.official = (form.values()["shop_type"] as? ShopTypeModel)?.isOfficial
    ProductCache.shared.fshop = ((form.values()["shop_type"] as? ShopTypeModel)?.isGoldMerchant ?? false) ? 2 : nil
    ProductCache.shared.resetProduct()
    ProductCache.shared.nextProduct()
    back(self)
  }
  
  @IBAction func reset(_ sender: Any) {
    priceRangeRow.value = PriceRangeModel(min: 0, max: 10000000, selectedMin: 0, selectedMax: 10000000)
    shopTypeRow.value = ShopTypeModel(isGoldMerchant: nil, isOfficial: nil)
    wholeSaleRow.value = false
    priceRangeRow.reload()
    wholeSaleRow.reload()
    shopTypeRow.reload()
  }
  
}
