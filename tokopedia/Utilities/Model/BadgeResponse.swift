//
//  BadgeResponse.swift
//  tokopedia
//
//  Created by Robyarta Haruli Ruci on 26/03/18.
//  Copyright © 2018 Robyarta Haruli Ruci. All rights reserved.
//

import UIKit
import ObjectMapper

class BadgeResponse: Mappable {

  var title: String?
  var imageUrl: String?
  
  required init?(map: Map) {}
  
  func mapping(map: Map) {
    title <- map["title"]
    imageUrl <- map["image_url"]
  }
  
}
