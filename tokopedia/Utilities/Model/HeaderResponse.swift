//
//  HeaderResponse.swift
//  tokopedia
//
//  Created by Robyarta Haruli Ruci on 26/03/18.
//  Copyright © 2018 Robyarta Haruli Ruci. All rights reserved.
//

import UIKit
import ObjectMapper

class HeaderResponse: Mappable {
  
  var totalData: Int?
  var processTime: Double?
  var additionalParam: String?
  var totalDataNoCategory: Int?
  var suggestionInstead: String?
  
  required init?(map: Map) {}
  
  func mapping(map: Map) {
    totalData <- map["total_data"]
    processTime <- map["process_time"]
    additionalParam <- map["additional_param"]
    suggestionInstead <- map["suggestion_instead"]
    totalDataNoCategory <- map["total_data_no_category"]
  }
  
}
