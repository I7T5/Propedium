//
//  DiemWidgetEntryView.swift
//  Propedium
//
//  Created by 唐依纳 on 2023/12/16.
//

import SwiftUI
import WidgetKit

struct DiemWidgetEntryView : View {
    var entry: DiemWidgetEntry

    var body: some View {
        Text("\(abs(entry.daysDiff))")
    }
}

#Preview {
    DiemWidgetEntryView(entry: DiemWidgetEntry(date: .now, diemName: "Christmas", diemDate: createDate(month: 12, day: 25)))
        .previewContext(WidgetPreviewContext(family: .systemSmall))
}
