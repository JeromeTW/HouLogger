// DateExtension.swift
// Copyright (c) 2019 Jerome Hsieh. All rights reserved.
// Created by Jerome Hsieh.

import Foundation

extension Date {
  public static func date(from dateString: String, format: String, abbreviation: String? = nil) -> Date? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    dateFormatter.timeZone = TimeZone.current
    dateFormatter.isLenient = true
    if let abbreviation = abbreviation {
      dateFormatter.timeZone = Foundation.TimeZone(abbreviation: abbreviation)
    }
    return dateFormatter.date(from: dateString)
  }

  public func toString(dateFormat: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.timeZone = TimeZone.current
    dateFormatter.dateFormat = dateFormat
    return dateFormatter.string(from: self)
  }
}
