//
//  WholesaleTableViewCell.swift
//  tokopedia
//
//  Created by Robyarta Haruli Ruci on 26/03/18.
//  Copyright © 2018 Robyarta Haruli Ruci. All rights reserved.
//

import UIKit
import Eureka
import RxSwift
import RxCocoa

class WholesaleTableViewCell: Cell<Bool>, CellType {

  @IBOutlet weak var switchView: UISwitch!
  
  let disposeBag = DisposeBag()
  
  override func setup() {
    super.setup()
    switchView.rx.isOn
      .subscribe(onNext: { [weak self] value in self?.row.value = value })
      .disposed(by: disposeBag)
  }
  
  override func update() {
    super.update()
    switchView.isOn = row.value ?? false
  }
    
}

final class WholesaleTableViewRow: Row<WholesaleTableViewCell>, RowType {
  required init(tag: String?) {
    super.init(tag: tag)
    cellProvider = CellProvider<WholesaleTableViewCell>(nibName: WholesaleTableViewCell.reuseIdentifier)
    cell.height = { return UITableViewAutomaticDimension }
  }
}
