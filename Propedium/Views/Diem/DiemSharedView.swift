//
//  DiemSharedView.swift
//  Propedium
//
//  Created by 唐依纳 on 2024/1/13.
//

import SwiftUI

struct DiemSharedView: View {
    var diem: Diem
    
    // Displaying dynamic dates in widgets https://developer.apple.com/documentation/widgetkit/displaying-dynamic-dates
    var body: some View {
        Text("\(abs(diem.daysDiff()))")
    }
}

#Preview {
    DiemSharedView(diem: .christmas)
        .modelContainer(previewContainer)
}
