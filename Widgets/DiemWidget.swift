//
//  PropediumWidgetExtension.swift
//  PropediumWidgetExtension
//
//  Created by 唐依纳 on 2023/11/9.
//

import WidgetKit
import SwiftUI
import SwiftData

// "How to access a SwiftData container from widgets"
// https://www.hackingwithswift.com/quick-start/swiftdata/how-to-access-a-swiftdata-container-from-widgets
// "How can I get data from SwiftData on Widget (macOS)"
// https://stackoverflow.com/questions/77322346/how-can-i-get-data-from-swiftdata-on-widget-macos

struct DiemWidget: Widget {
    let kind: String = "DiemWidget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(
            kind: kind,
            intent: DiemWidgetIntent.self,
            provider: Provider()
        ) { entry in
            DiemWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
    }
}

//extension DiemWidgetIntent {
//    fileprivate static var smiley:
//        ...
//    fileprivate static var starEyes:
//        ...
//}

#Preview(as: .systemSmall) {
    DiemWidget()
} timeline: {
    DiemWidgetEntry(date: .now, configuration: .christmas)
    DiemWidgetEntry(date: .now, configuration: .independenceDay)
}
