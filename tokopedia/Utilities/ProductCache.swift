//
//  ProductCache.swift
//  tokopedia
//
//  Created by Robyarta Ruci on 27/03/18.
//  Copyright © 2018 Robyarta Haruli Ruci. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Alamofire
import AlamofireObjectMapper

class ProductCache: NSObject {

  static let shared = ProductCache()
  
  let products = Variable<[ProductResponse]>([])
  
  var q: String? = "Samsung"
  var minPrice: Int = 0
  var maxPrice: Int = 10000000
  var wholesale: Bool = false
  var official: Bool = false
  var fshop: Int = 2
  
  override init() {
    super.init()
  }
  
  func resetProduct() { products.value = [] }
  
  func nextProduct(completion: (() -> Void)? = nil) {
    var urlString = "https://ace.tokopedia.com/search/v2.5/product?"
    if let query = q { urlString.append("q=\(query)") }
    urlString.append("&start=\(products.value.count)")
    urlString.append("&rows=\(10)")
    urlString.append("&pmin=\(minPrice)")
    urlString.append("&pmax=\(maxPrice)")
    urlString.append("&wholesale=\(wholesale ? "true" : "false")")
    urlString.append("&official=\(official ? "true" : "false")")
    urlString.append("&fshop=\(fshop)")
    print(urlString)
    guard let url = URL(string: urlString) else {completion?(); return}
    request(url).responseObject { [weak self] (response: DataResponse<ProductsResponse>) in
      guard let _self = self else {completion?(); return}
      _self.products.value.append(contentsOf: response.value?.data ?? [])
      completion?()
    }
  }
  
}
