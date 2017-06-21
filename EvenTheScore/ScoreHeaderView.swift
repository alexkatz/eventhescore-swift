//
//  ScoreHeaderView.swift
//  EvenTheScore
//
//  Created by Alexander Katz on 6/18/17.
//  Copyright © 2017 Alexander Katz. All rights reserved.
//

import UIKit

class ScoreHeaderView: UICollectionReusableView {
  
  static let identifier = "ScoreHeaderView"
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    initialize()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    initialize()
  }
  
  func initialize() {
    backgroundColor = UIColor.orange
  }
  
}
