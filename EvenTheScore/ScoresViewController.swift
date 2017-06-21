//
//  ViewController.swift
//  EvenTheScore
//
//  Created by Alexander Katz on 12/8/16.
//  Copyright © 2016 Alexander Katz. All rights reserved.
//

import UIKit
import SnapKit
import RealmSwift

class ScoresViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
  
  var collectionView: UICollectionView!
  var scores: [(key: Date, value: [Score])] = []

  // MARK: lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.white
    title = "Scores"
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addScore))
    
    let layout = UICollectionViewFlowLayout()
    layout.minimumLineSpacing = Constants.PADDING
    layout.minimumInteritemSpacing = Constants.PADDING
    layout.scrollDirection = .vertical
    layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: Constants.CELL_HEIGHT)
    layout.sectionHeadersPinToVisibleBounds = true
    layout.headerReferenceSize = CGSize(width: UIScreen.main.bounds.width, height: 20)
    
    collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
    collectionView.alwaysBounceVertical = true
    collectionView.backgroundColor = UIColor.clear
    collectionView.register(ScoreCollectionViewCell.self, forCellWithReuseIdentifier: ScoreCollectionViewCell.identifier)
    collectionView.register(ScoreHeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: ScoreHeaderView.identifier)
    collectionView.dataSource = self
    collectionView.delegate = self
    
    view.addSubview(collectionView)
    collectionView.snp.makeConstraints { make in
        make.edges.equalToSuperview()
    }
    
    do {
      let realm = try Realm()
      scores = getScoresByDate(scores: Array(realm.objects(Score.self)))
    } catch {
      print(error)
    }
  }
  
  // MARK: collection view data source

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ScoreCollectionViewCell.identifier, for: indexPath) as! ScoreCollectionViewCell
    let score = scores[indexPath.section].value[indexPath.item]
    cell.titleLabel.text = score.alexScore ? "Alex" : "Ethan"
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: ScoreHeaderView.identifier, for: indexPath) as! ScoreHeaderView
    return view
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return scores[section].value.count
  }
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return scores.count
  }
  
  // MARK: collection view delegate
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let score = scores[indexPath.section].value[indexPath.item]
    
  }
  
  // MARK: custom methods
  
  func addScore() {
    let handler: (UIAlertAction) -> Void = { action in
      do {
        let realm = try Realm()
        try realm.write {
          let score = Score()
          score.alexScore = action.title == "Alex"
          score.ethanScore = action.title == "Ethan"
          realm.add(score)
          self.collectionView.performBatchUpdates({
            let newScores = self.getScoresByDate(scores: Array(realm.objects(Score.self)))
            let oldScores = self.scores
            self.scores = newScores
            if newScores.count > oldScores.count {
              self.scores = newScores
              self.collectionView.insertSections([0])
            } else {
              self.collectionView.insertItems(at: [IndexPath(item: 0, section: 0)])
            }
          })
        }
      } catch {
        print(error)
      }
    }
    
    let alertController = UIAlertController(title: "Add score", message: nil, preferredStyle: .actionSheet)
    alertController.addAction(UIAlertAction(title: "Alex", style: .default, handler: handler))
    alertController.addAction(UIAlertAction(title: "Ethan", style: .default, handler: handler))
    alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
    
    present(alertController, animated: true, completion: nil)
  }
  
  func getScoresByDate(scores: [Score]) -> [(key: Date, value: [Score])] {
    var scoresByDay = [Date: [Score]]()
    for score in scores {
      let date = getScoreKey(score)
      if scoresByDay[date] != nil {
        scoresByDay[date]?.append(score)
      } else {
        scoresByDay[date] = [score]
      }
    }
    
    return scoresByDay.sorted { $0.0 > $1.0 }
  }
  
  func getScoreKey(_ score: Score) -> Date {
    return score.createdAt.dateToMinute()
  }

}

