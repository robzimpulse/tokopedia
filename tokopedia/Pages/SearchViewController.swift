//
//  SearchViewController.swift
//  tokopedia
//
//  Created by Robyarta Haruli Ruci on 26/03/18.
//  Copyright © 2018 Robyarta Haruli Ruci. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Alamofire
import RxSwiftExt
import AlamofireObjectMapper
import UIScrollView_InfiniteScroll

class SearchViewController: UIViewController {
  
  typealias cell = ProductCell
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  let disposeBag = DisposeBag()
  
  lazy var layout: UICollectionViewFlowLayout = {
    let flowLayout = UICollectionViewFlowLayout()
    flowLayout.minimumLineSpacing = 1
    flowLayout.minimumInteritemSpacing = 1
    flowLayout.scrollDirection = .vertical
    return flowLayout
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView.register(cell.nib, forCellWithReuseIdentifier: cell.reuseIdentifier)
    
    ProductCache.shared.products.asObservable().bind(
      to: collectionView.rx.items(cellIdentifier: cell.reuseIdentifier, cellType: cell.self),
      curriedArgument: { row, model, cell in cell.configure(model: model) }
    ).disposed(by: disposeBag)

    collectionView.setShouldShowInfiniteScrollHandler({ _ in return true })
    
    collectionView.infiniteScrollTriggerOffset = 600
    
    collectionView.addInfiniteScroll(handler: { collectionView in
      ProductCache.shared.nextProduct()
      collectionView.finishInfiniteScroll()
    })
    
    collectionView.beginInfiniteScroll(false)
    
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    layout.itemSize = CGSize(
      width: (collectionView.bounds.width - CGFloat(1)) / CGFloat(2) ,
      height: (collectionView.bounds.height - CGFloat(1)) / CGFloat(2)
    )
    collectionView.contentInset.top = 8
    collectionView.contentInset.bottom = 8
    collectionView.setCollectionViewLayout(layout, animated: false)
  }
  
}
