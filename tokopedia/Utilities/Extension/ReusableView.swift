//
//  ReusableView.swift
//  tokopedia
//
//  Created by Robyarta Haruli Ruci on 26/03/18.
//  Copyright © 2018 Robyarta Haruli Ruci. All rights reserved.
//

import UIKit

protocol ReusableView: class {
  static var reuseIdentifier: String {get}
  static var nib: UINib {get}
}

extension ReusableView {
  static var reuseIdentifier: String { return String(describing: self) }
  static var nib: UINib { return UINib(nibName: reuseIdentifier, bundle: nil) }
}
