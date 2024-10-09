//
//  DiemWidget+EntryView.swift
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
        let diem: Diem = .init(from: entry.configuration.diem)
        
        // TODO: DiemBaseView
//        DiemGridItem(diem: diem)
        
    }
}

#Preview {
//    ModelContainerPreview(ModelContainer.sample) {
//        DiemWidgetEntryView(entry: DiemWidgetEntry(date: Date(), configuration: .christmas))
//    }
    
    DiemWidgetEntryView(entry: DiemWidgetEntry(date: Date(), configuration: .christmas))
        .modelContainer(previewContainer)
}

//extension DiemWidgetEntryView {
//    @ViewBuilder
//    private var contentView: some View {
//        if let productInfo = entry.productInfo {
//            Text("Count: \(productInfo.count)")
//                .font(.subheadline)
//                .bold()
//            if let lastItem = productInfo.lastItem {
//                Group {
//                    Text("Last item:")
//                    Text(lastItem.name)
//                }
//                .font(.footnote)
//            }
//        } else {
//            Text("Info unavailable")
//                .font(.subheadline)
//                .foregroundStyle(.secondary)
//        }
//    }
//}
