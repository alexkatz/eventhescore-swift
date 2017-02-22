//
//  InterfaceController.swift
//  EvenTheScore WatchKit Extension
//
//  Created by Alexander Katz on 12/8/16.
//  Copyright © 2016 Alexander Katz. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
  
  @IBOutlet var label: WKInterfaceLabel!
  
  var labelTexts: [String] = [
    "Alex rules at pool.",
    "Ethan sucks at pool.<3",
    "Ethan rules at pool.",
    "Alex sucks at pool.<3"
  ]
  
  var textIndex: Int = 0
  
  @IBAction func onTap(_ sender: Any) {
    textIndex = (textIndex + 1) % labelTexts.count
    label.setText(labelTexts[textIndex])
  }
  
  override func awake(withContext context: Any?) {
    super.awake(withContext: context)
    
    // Configure interface objects here.
  }
  
  override func willActivate() {
    // This method is called when watch view controller is about to be visible to user
    super.willActivate()
    label.setText(labelTexts.first)
  }
  
  override func didDeactivate() {
    // This method is called when watch view controller is no longer visible
    super.didDeactivate()
  }
  
}
