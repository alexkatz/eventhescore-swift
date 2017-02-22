//
//  ViewController.swift
//  EvenTheScore
//
//  Created by Alexander Katz on 12/8/16.
//  Copyright © 2016 Alexander Katz. All rights reserved.
//

import UIKit

class ScoresViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
  
  var collectionView: UICollectionView!
  var initialized = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.white
    title = "Scores"
    
    let layout = ScoresCollectionViewLayout()
    collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
    collectionView.backgroundColor = UIColor.clear
    collectionView.register(ScoreCollectionViewCell.nib, forCellWithReuseIdentifier: ScoreCollectionViewCell.identifier)
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.contentInset = UIEdgeInsets(top: Constants.padding, left: 0, bottom: Constants.padding, right: 0)
    view.addChildViewAndConstrainToBounds(childView: collectionView)
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ScoreCollectionViewCell.identifier, for: indexPath) as! ScoreCollectionViewCell
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 20
  }
}

