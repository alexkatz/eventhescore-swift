//
//  ScoreCollectionViewCell.swift
//  EvenTheScore
//
//  Created by Alexander Katz on 2/19/17.
//  Copyright © 2017 Alexander Katz. All rights reserved.
//

import UIKit
import SnapKit

class ScoreCollectionViewCell: UICollectionViewCell {
  
  static let identifier = "ScoreCollectionViewCell"
  
  let titleLabel = UILabel()
  let bottomBorderView = UIView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    initialize()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    initialize()
  }
  
  func initialize() {
    contentView.addSubview(titleLabel)
    titleLabel.snp.makeConstraints { make in
      make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: Constants.PADDING, bottom: 0, right: 0))
    }
    
    contentView.addSubview(bottomBorderView)
    bottomBorderView.backgroundColor = UIColor.lightGray
    bottomBorderView.snp.makeConstraints { make in
      make.bottom.equalToSuperview()
      make.left.equalToSuperview()
      make.right.equalToSuperview()
      make.height.equalTo(0.5)
    }
  }
  
}
