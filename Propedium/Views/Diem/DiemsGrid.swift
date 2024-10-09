//
//  DiemGridView.swift
//  Propedium
//
//  Created by 唐依纳 on 2024/1/9.
//

import SwiftUI
import SwiftData

struct DiemsGrid: View {
    // https://www.hackingwithswift.com/quick-start/swiftdata/how-to-use-mvvm-to-separate-swiftdata-from-your-views
    @Query(sort: \Diem.date) var diems: [Diem]

    let layout = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        let paddingSize = (UIScreen.main.bounds.width / 2 - getSmallWidgetSideLength()) / 2
        
        ScrollView(.vertical) {
            LazyVGrid(columns: layout, spacing: 0) {
                ForEach(diems) { diem in
                    DiemGridItem(diem: diem)
                        .padding(.horizontal, paddingSize)
                        .padding(.vertical, paddingSize / 2)
                }
            }
            .padding(.horizontal, paddingSize)
        }
    }
}

#Preview {
//    ModelContainerPreview(ModelContainer.sample) {
//        DiemsGrid()
//    }
    NavigationStack {
        DiemsGrid()
            .modelContainer(previewContainer)
    }
}
