//
//  StatusResponse.swift
//  tokopedia
//
//  Created by Robyarta Haruli Ruci on 26/03/18.
//  Copyright © 2018 Robyarta Haruli Ruci. All rights reserved.
//

import UIKit
import ObjectMapper

class StatusResponse: Mappable {
  
  var errorCode: Int?
  var message: String?
  
  required init?(map: Map) {}
  
  func mapping(map: Map) {
    message <- map["message"]
    errorCode <- map["error_code"]
  }
  
}
