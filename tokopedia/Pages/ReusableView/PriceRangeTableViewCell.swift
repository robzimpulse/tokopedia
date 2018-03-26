//
//  PriceRangeTableViewCell.swift
//  tokopedia
//
//  Created by Robyarta Haruli Ruci on 26/03/18.
//  Copyright © 2018 Robyarta Haruli Ruci. All rights reserved.
//

import UIKit
import Eureka
import RxSwift
import RxCocoa
import RangeSeekSlider
import EZSwiftExtensions
import TSCurrencyTextField

struct PriceRangeModel: Equatable {
  var min: Int
  var max: Int
  static func ==(lhs: PriceRangeModel, rhs: PriceRangeModel) -> Bool {
    return lhs.min == rhs.min && lhs.max == rhs.max
  }
}

class PriceRangeTableViewCell: Cell<PriceRangeModel>, CellType {

  @IBOutlet weak var minTextField: TSCurrencyTextField!
  @IBOutlet weak var maxTextField: TSCurrencyTextField!
  @IBOutlet weak var slider: RangeSeekSlider!
  
  let disposeBag = DisposeBag()
  let formatter: NumberFormatter = {
    let _formatter = NumberFormatter()
    _formatter.numberStyle = .currency
    _formatter.minimumFractionDigits = 0
    _formatter.maximumFractionDigits = 0
    _formatter.generatesDecimalNumbers = false
    _formatter.currencySymbol = "Rp. "
    _formatter.currencyGroupingSeparator = "."
    return _formatter
  }()
  
  override func setup() {
    super.setup()
    minTextField.currencyNumberFormatter = formatter
    maxTextField.currencyNumberFormatter = formatter
    
    slider.delegate = self
    slider.delegate?.rangeSeekSlider(slider, didChange: slider.minValue, maxValue: slider.maxValue)
    
    minTextField.rx.text.orEmpty
      .skip(1)
      .map({ [weak self] _ in self?.minTextField.amount })
      .unwrap()
      .map({ CGFloat(exactly: $0) })
      .unwrap()
      .debounce(0.3, scheduler: MainScheduler.instance)
      .subscribe(onNext: { [weak self] in
        guard let _self = self else {return}
        guard _self.maxTextField.amount.intValue >= Int($0) else {
          _self.slider.delegate?.rangeSeekSlider(_self.slider, didChange: _self.slider.selectedMinValue, maxValue: _self.slider.selectedMaxValue)
          return
        }
        _self.slider.selectedMinValue = $0
        _self.slider.layoutSubviews()
      })
      .disposed(by: disposeBag)

    maxTextField.rx.text.orEmpty
      .skip(1)
      .map({ [weak self] _ in self?.maxTextField.amount })
      .unwrap()
      .map({ CGFloat(exactly: $0) })
      .unwrap()
      .debounce(0.3, scheduler: MainScheduler.instance)
      .subscribe(onNext: { [weak self] in
        guard let _self = self else {return}
        guard _self.minTextField.amount.intValue <= Int($0) else {
          _self.slider.delegate?.rangeSeekSlider(_self.slider, didChange: _self.slider.selectedMinValue, maxValue: _self.slider.selectedMaxValue)
          return
        }
        _self.slider.selectedMaxValue = $0
        _self.slider.layoutSubviews()
      })
      .disposed(by: disposeBag)
    
  }
  
  override func update() {
    super.update()
    if let value = row.value {
      slider.minValue = CGFloat(value.min)
      slider.maxValue = CGFloat(value.max)
      slider.selectedMinValue = CGFloat(value.min)
      slider.selectedMaxValue = CGFloat(value.max)
      slider.delegate?.rangeSeekSlider(slider, didChange: CGFloat(value.min), maxValue: CGFloat(value.max))
      slider.layoutSubviews()
    }
  }
  
}

extension PriceRangeTableViewCell: RangeSeekSliderDelegate {
  func rangeSeekSlider(_ slider: RangeSeekSlider, didChange minValue: CGFloat, maxValue: CGFloat) {
    minTextField.amount = NSNumber(value: Float(minValue))
    maxTextField.amount = NSNumber(value: Float(maxValue))
    row.value?.min = Int(minValue)
    row.value?.max = Int(maxValue)
  }
}

final class PriceRangeTableViewRow: Row<PriceRangeTableViewCell>, RowType {
  required init(tag: String?) {
    super.init(tag: tag)
    cellProvider = CellProvider<PriceRangeTableViewCell>(nibName: PriceRangeTableViewCell.reuseIdentifier)
    cell.height = { return UITableViewAutomaticDimension }
  }
}
