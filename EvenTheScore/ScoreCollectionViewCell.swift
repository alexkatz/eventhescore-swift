//
//  ScoreCollectionViewCell.swift
//  EvenTheScore
//
//  Created by Alexander Katz on 2/19/17.
//  Copyright © 2017 Alexander Katz. All rights reserved.
//

import UIKit

class ScoreCollectionViewCell: UICollectionViewCell {
  
  static let nib = UINib(nibName: "ScoreCollectionViewCell", bundle: nil)
  static let identifier = "ScoreCollectionViewCell"
  
  override func awakeFromNib() {
    super.awakeFromNib()
    contentView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
  }
  
}
