//
//  ProductCell.swift
//  tokopedia
//
//  Created by Robyarta Haruli Ruci on 26/03/18.
//  Copyright © 2018 Robyarta Haruli Ruci. All rights reserved.
//

import UIKit
import AlamofireImage

class ProductCell: UICollectionViewCell {

  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var priceLabel: UILabel!
  
  func configure(model: ProductResponse) {
    imageView.image = nil
    nameLabel.text = model.name
    priceLabel.text = model.price
    guard let url = URL(string: model.imageUri700 ?? "") else {return}
    imageView.af_setImage(withURL: url)
  }
  
}
