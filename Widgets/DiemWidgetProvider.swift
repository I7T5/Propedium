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
    let modelContext = ModelContext(try! ModelContainer(for: Diem.self))  // same issue as Intent
    
    func placeholder(in context: Context) -> DiemWidgetEntry {
//        let diem = try! modelContext.fetch(FetchDescriptor<Diem>(sortBy: [.init(\.date)])).first!
        return DiemWidgetEntry(date: Date(), diem: .christmas)
    }

    func snapshot(for configuration: DiemWidgetIntent, in context: Context) async -> DiemWidgetEntry {
        let diems = try! modelContext.fetch(FetchDescriptor<Diem>(sortBy: [.init(\.date)]))
        logger.info("Found \(diems.count) diems")
        guard let diem = diems.first else {
            return .empty
        }
        
        return DiemWidgetEntry(date: .now, diem: diem)
    }
    
    func timeline(for configuration: DiemWidgetIntent, in context: Context) async -> Timeline<DiemWidgetEntry> {
//        var entries: [DiemWidgetEntry] = []
//        

//        logger.info("Found \(diems.count) diems")
//        guard let diem = diems.first else {
//            return Timeline(
//                entries: [.empty],
//                policy: .never
//            )
//        }
//        
//        // TODO: update widget once per day
//        let entry = DiemWidgetEntry(date: .now, diem: diem)
//        entries.append(entry)
//        
//        return Timeline(entries: entries, policy: .atEnd)
        
        // Use the selected intent parameter to generate the timeline entry
        if let diemEntity = configuration.diem {
            let diem = Diem(name: diemEntity.name, date: diemEntity.date)
            let entry = DiemWidgetEntry(date: .now, diem: diem)
            let timeline = Timeline(entries: [entry], policy: .atEnd)
            return timeline
        } else {
            // If no diem is selected, provide a placeholder or default entry
            let diems = try! modelContext.fetch(FetchDescriptor<Diem>(sortBy: [.init(\.date)]))
            guard let diem = diems.first else {
                return Timeline(
                    entries: [.empty],
                    policy: .never
                )
            }
            return Timeline(entries: [DiemWidgetEntry(date: .now, diem: diem)], policy: .atEnd)
        }
    }
}
