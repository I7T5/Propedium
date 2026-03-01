//
//  DiemWidgetProvider.swift
//  Propedium
//
//  Created by 唐依纳 on 2023/12/16.
//


import WidgetKit
import AppIntents
import SwiftData
import OSLog

// TODO: Modify Provider according to Backyard Birds

//struct DiemWidgetProvider: AppIntentTimelineProvider {
//    func placeholder(in context: Context) -> DiemWidgetEntry {
//        DiemWidgetEntry(date: Date(), configuration: DiemWidgetIntent())
//    }
//
//    func snapshot(for configuration: DiemWidgetIntent, in context: Context) async -> DiemWidgetEntry {
//        DiemWidgetEntry(date: Date(), configuration: configuration)
//    }
//    
//    func timeline(for configuration: DiemWidgetIntent, in context: Context) async -> Timeline<DiemWidgetEntry> {
//        var entries: [DiemWidgetEntry] = []
//
//        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
//        let currentDate = Date()
//        for hourOffset in 0 ..< 5 {
//            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
//            let entry = DiemWidgetEntry(date: entryDate, configuration: configuration)
//            entries.append(entry)
//        }
//
//        return Timeline(entries: entries, policy: .atEnd)
//    }
//}

/*
Reference: https://developer.apple.com/documentation/swiftui/backyard-birds-sample
See the LICENSE.txt file for this sample’s licensing information.
*/

private let logger = Logger(subsystem: "Widgets", category: "DiemTimelineProvider")

struct DiemWidgetProvider: AppIntentTimelineProvider {
    let modelContext = ModelContext(Diem.sharedModelContainer)
    
    func placeholder(in context: Context) -> DiemWidgetEntry {
        logger.info("Calling placeholder() in DiemWidgetProvider...")
        return DiemWidgetEntry(date: .now, diemName: "Placeholder", diemDate: .now)
    }

    func snapshot(for configuration: DiemWidgetIntent, in context: Context) async -> DiemWidgetEntry {
        let diems = try! modelContext.fetch(FetchDescriptor<Diem>(sortBy: [.init(\.date)]))
        logger.info("snapshot: Found \(diems.count) diems")
        guard let diem = diems.first else {
            return DiemWidgetEntry(date: .now, diemName: "Placeholder", diemDate: .now)
        }
        // Extract plain values while the ModelContext is alive
        return DiemWidgetEntry(date: .now, diemName: diem.name, diemDate: diem.date)
    }

    func timeline(for configuration: DiemWidgetIntent, in context: Context) async -> Timeline<DiemWidgetEntry> {
        // TODO: update widget once per day

        // If a diem was selected, use the entity's data directly — no need to fetch
        // DiemEntity already carries the name and date as plain values
        if let diemEntity = configuration.diem {
            logger.info("Found configuration diem: \(diemEntity.name)")
            let entry = DiemWidgetEntry(date: .now, diemName: diemEntity.name, diemDate: diemEntity.date)
            return Timeline(entries: [entry], policy: .atEnd)
        }

        // No diem selected — fall back to the first diem in the database
        logger.info("No diem selected. Providing default diem to widget...")
        let diems = try! modelContext.fetch(FetchDescriptor<Diem>(sortBy: [.init(\.date)]))
        logger.info("Found \(diems.count) diems")
        guard let diem = diems.first else {
            logger.info("Using placeholder diem")
            return Timeline(
                entries: [DiemWidgetEntry(date: .now, diemName: "Placeholder", diemDate: .now)],
                policy: .never
            )
        }
        // Extract plain values while the ModelContext is alive
        logger.info("Using first diem as default...")
        return Timeline(entries: [DiemWidgetEntry(date: .now, diemName: diem.name, diemDate: diem.date)], policy: .atEnd)
    }
}
