//
//  DiemWidget+Provider.swift
//  Propedium
//
//  Created by 唐依纳 on 2023/12/16.
//


import WidgetKit
import AppIntents

// TODO: Modify Provider according to Backyard Birds
/*
Reference: https://developer.apple.com/documentation/swiftui/backyard-birds-sample
See the LICENSE.txt file for this sample’s licensing information.
*/
struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> DiemWidgetEntry {
        DiemWidgetEntry(date: Date(), configuration: DiemWidgetIntent())
    }

    func snapshot(for configuration: DiemWidgetIntent, in context: Context) async -> DiemWidgetEntry {
        DiemWidgetEntry(date: Date(), configuration: configuration)
    }
    
    func timeline(for configuration: DiemWidgetIntent, in context: Context) async -> Timeline<DiemWidgetEntry> {
        var entries: [DiemWidgetEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = DiemWidgetEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        return Timeline(entries: entries, policy: .atEnd)
    }
}
