//
//  ProductResponse.swift
//  tokopedia
//
//  Created by Robyarta Haruli Ruci on 26/03/18.
//  Copyright © 2018 Robyarta Haruli Ruci. All rights reserved.
//

import UIKit
import ObjectMapper

class ProductResponse: Mappable {

  var id: Int?
  var name: String?
  var uri: String?
  var imageUri: String?
  var imageUri700: String?
  var price: String?
  var categoryBreadcrumb: String?
  var shop: ShopResponse?
  var wholesalePrice: [WholesalePriceResponse]?
  var condition: Int?
  var preorder: Int?
  var departmentId: Int?
  var rating: Int?
  var isFeatured: Int?
  var countReview: Int?
  var countTalk: Int?
  var countSold: Int?
  
  var labels: [LabelResponse]?
  var badges: [BadgeResponse]?
  
  var originalPrice: String?
  var discountedPrice: String?
  var discountPercentage: Int?
  var stock: Int?
  
  required init?(map: Map) {}
  
  func mapping(map: Map) {
    
    id <- map["id"]
    name <- map["name"]
    uri <- map["uri"]
    imageUri <- map["image_uri"]
    imageUri700 <- map["image_uri_700"]
    price <- map["price"]
    categoryBreadcrumb <- map["category_breadcrumb"]
    shop <- map["shop"]
    wholesalePrice <- map["wholesale_price"]
    condition <- map["condition"]
    preorder <- map["preorder"]
    departmentId <- map["department_id"]
    rating <- map["rating"]
    isFeatured <- map["is_featured"]
    countReview <- map["count_review"]
    countTalk <- map["count_talk"]
    countSold <- map["count_sold"]
    labels <- map["labels"]
    badges <- map["badges"]
    originalPrice <- map["original_price"]
    discountedPrice <- map["discounted_price"]
    discountPercentage <- map["discounted_percentage"]
    stock <- map["stock"]
  }
  
}
