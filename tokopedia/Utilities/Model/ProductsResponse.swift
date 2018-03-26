//
//  ProductsResponse.swift
//  tokopedia
//
//  Created by Robyarta Haruli Ruci on 26/03/18.
//  Copyright © 2018 Robyarta Haruli Ruci. All rights reserved.
//

import UIKit
import ObjectMapper

class ProductsResponse: Mappable {

  var data: [ProductResponse]?
  var status: StatusResponse?
  var header: HeaderResponse?
  var category: CategoriesResponse?
  
  required init?(map: Map) {}
  
  func mapping(map: Map) {
    data <- map["data"]
    status <- map["status"]
    header <- map["header"]
    category <- map["category"]
  }
  
}
