//
//  HelperFunctions.swift
//  Propedium
//
//  Created by 唐依纳 on 2024/1/11.
//

import Foundation

func toDate(date: String) -> Date {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    return formatter.date(from: date)!
}

func toString(date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "MMM dd, yyyy"
    return formatter.string(from: date)
}

func createDate(year: Int? = nil, month: Int, day: Int) -> Date {
    
    let calendar = Calendar.current
    var computedYear = calendar.component(.year, from: Date())
    // If day is past in year, set day to next year
    if month <= calendar.component(.month, from: Date()) {
        if day < calendar.component(.day, from: Date()) {
            computedYear += 1
        }
    }
    let year = year ?? computedYear
    
    // TODO: error handling
    
    return calendar.date(from: DateComponents(year: year, month: month, day: day))!
    
    // If both month and day are greater than today, then, if year is nil, year += 1
}
