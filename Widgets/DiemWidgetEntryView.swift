//
//  DiemWidgetEntryView.swift
//  Propedium
//
//  Created by 唐依纳 on 2023/12/16.
//

import SwiftUI
import WidgetKit
import SwiftData

struct DiemWidgetEntryView : View {
    var entry: DiemWidgetEntry

    var body: some View {
//        Text("\(abs(Diem(from: entry.configuration.diem).daysDiff()))")
        if let diem: Diem = entry.diem {
            DiemSharedView(diem: diem)
        } else {
            DiemSharedView(diem: .placeholder)
        }
        
        
    }
}

#Preview {
//    ModelContainerPreview(ModelContainer.sample) {
//        DiemWidgetEntryView(entry: DiemWidgetEntry(date: Date(), configuration: .christmas))
//    }
    
    DiemWidgetEntryView(entry: DiemWidgetEntry(date: Date(), diem: .christmas))
        .previewContext(WidgetPreviewContext(family: .systemSmall))
        .modelContainer(previewContainer)
}
