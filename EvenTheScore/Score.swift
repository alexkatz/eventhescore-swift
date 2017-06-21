//
//  Score.swift
//  EvenTheScore
//
//  Created by Alexander Katz on 6/17/17.
//  Copyright © 2017 Alexander Katz. All rights reserved.
//

import Foundation
import RealmSwift

class Score : Object {
  dynamic var createdAt = NSDate()
  dynamic var ethanScore: Bool = false
  dynamic var alexScore: Bool = false
}
