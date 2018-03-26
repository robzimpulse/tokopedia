//
//  ShopResponse.swift
//  tokopedia
//
//  Created by Robyarta Haruli Ruci on 26/03/18.
//  Copyright © 2018 Robyarta Haruli Ruci. All rights reserved.
//

import UIKit
import ObjectMapper

class ShopResponse: Mappable {

  var id: Int?
  var name: String?
  var uri: String?
  var isGold: Int?
  var rating: Int?
  var location: String?
  var reputationImageUri: String?
  var shopLucky: String?
  var city: String?
  
  required init?(map: Map) {}
  
  func mapping(map: Map) {
    id <- map["id"]
    name <- map["name"]
    uri <- map["uri"]
    isGold <- map["is_gold"]
    rating <- map["rating"]
    location <- map["location"]
    reputationImageUri <- map["reputation_image_uri"]
    shopLucky <- map["shop_lucky"]
    city <- map["city"]
  }
  
}
