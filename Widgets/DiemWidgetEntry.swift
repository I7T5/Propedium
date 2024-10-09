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
    let configuration: DiemWidgetIntent
}
