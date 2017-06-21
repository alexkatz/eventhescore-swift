//
//  NSDate.swift
//  EvenTheScore
//
//  Created by Alexander Katz on 6/18/17.
//  Copyright © 2017 Alexander Katz. All rights reserved.
//

import Foundation

extension NSDate {
  
  func dateToDay() -> Date {
    let timeZone = TimeZone.current
    let timeIntervalWithTimeZone = self.timeIntervalSinceReferenceDate + Double(timeZone.secondsFromGMT())
    let timeInterval = floor(timeIntervalWithTimeZone / 86400) * 86400
    return Date(timeIntervalSinceReferenceDate: timeInterval)
  }
  
  func dateToHour() -> Date {
    let timeZone = TimeZone.current
    let timeIntervalWithTimeZone = self.timeIntervalSinceReferenceDate + Double(timeZone.secondsFromGMT())
    let secondsInADay = 86400
    let secondsInAnHour = Double(secondsInADay / 24)
    let timeInterval = floor(timeIntervalWithTimeZone / secondsInAnHour) * secondsInAnHour
    return Date(timeIntervalSinceReferenceDate: timeInterval)
  }
  
  func dateToMinute() -> Date {
    let timeZone = TimeZone.current
    let timeIntervalWithTimeZone = self.timeIntervalSinceReferenceDate + Double(timeZone.secondsFromGMT())
    let secondsInADay = 86400
    let secondsInAnHour = Double(secondsInADay / 24)
    let secondsInAMinute = Double(secondsInAnHour / 60)
    let timeInterval = floor(timeIntervalWithTimeZone / secondsInAMinute) * secondsInAMinute
    return Date(timeIntervalSinceReferenceDate: timeInterval)
  }
  
}
