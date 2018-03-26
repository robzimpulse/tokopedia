//
//  WholesalePriceResponse.swift
//  tokopedia
//
//  Created by Robyarta Haruli Ruci on 26/03/18.
//  Copyright © 2018 Robyarta Haruli Ruci. All rights reserved.
//

import UIKit
import ObjectMapper

class WholesalePriceResponse: Mappable {

  var countMin: Int?
  var countMax: Int?
  var price: String?
  
  required init?(map: Map) {}
  
  func mapping(map: Map) {
    countMax <- map["count_max"]
    countMin <- map["count_min"]
    price <- map["price"]
  }
  
}
