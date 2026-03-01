//
//  DiemWidget+Entry.swift
//  Propedium
//
//  Created by 唐依纳 on 2023/12/16.
//

import WidgetKit
import AppIntents

struct DiemWidgetEntry: TimelineEntry {
    var date: Date
    var diemName: String
    var diemDate: Date

    var daysDiff: Int {
        Calendar.current.dateComponents([.day], from: Date(), to: diemDate).day ?? 0
    }
}
