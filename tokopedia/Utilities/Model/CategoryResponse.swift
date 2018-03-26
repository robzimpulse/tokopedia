//
//  CategoryResponse.swift
//  tokopedia
//
//  Created by Robyarta Haruli Ruci on 26/03/18.
//  Copyright © 2018 Robyarta Haruli Ruci. All rights reserved.
//

import UIKit
import ObjectMapper

class CategoryResponse: Mappable {

  var id: Int?
  var name: String?
  var total: String?
  var parentId: Int?
  var childId: [Int]?
  var level: Int?
  
  required init?(map: Map) {}
  
  func mapping(map: Map) {
    id <- map["id"]
    name <- map["name"]
    total <- map["total"]
    parentId <- map["parent_id"]
    childId <- map["child_id"]
    level <- map["level"]
  }
  
}
