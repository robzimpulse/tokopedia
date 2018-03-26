//
//  CategoriesResponse.swift
//  tokopedia
//
//  Created by Robyarta Haruli Ruci on 26/03/18.
//  Copyright © 2018 Robyarta Haruli Ruci. All rights reserved.
//

import UIKit
import ObjectMapper
import EZSwiftExtensions

class CategoriesResponse: Mappable {

  var data: [CategoryResponse]?
  var selectedId: String?
  
  required init?(map: Map) {}
  
  func mapping(map: Map) {
    
    data = (map.JSON["data"] as? [String: Any])?.map({ $0.value }).flatMap({ Mapper<CategoryResponse>().map(JSONObject: $0) })
    selectedId <- map["selected_id"]
  }
  
}
