//
//  DiemView.swift
//  Propedium
//
//  Created by 唐依纳 on 2023/10/18.
//

import SwiftUI
import WidgetKit
import AppIntents
import SwiftData


// https://stackoverflow.com/questions/64055137/acess-widget-view-from-app-contentview-in-swiftui

// TODO: DiemListItemView

// DiemGridItem
struct DiemGridItem: View {
    var diem: Diem
    
    var body: some View {
        
        // TODO: remove NavigationLink styling
        NavigationLink(value: diem.id) {
            let sideLength = getSmallWidgetSideLength()
            
            // TODO: Replace VStack with DiemWidgetEntryView
            // DiemWidgetEntryView(entry: DiemWidgetEntry(date: Date(), configuration: .smiley))
            VStack (alignment: .center) {
                DiemSharedView(diem: diem)
                    .font(.largeTitle)
                    .frame(width: sideLength, height: sideLength)
                    .background(Color(.white))
                    .cornerRadius(sideLength / 6.4)  // https://stackoverflow.com/a/3813969/19374566
                    .shadow(color: Color(.sRGBLinear, white: 0.1, opacity: 0.33), radius: 5)
                
                Text("\(diem.name)")
                    .lineLimit(1)
                    .allowsTightening(true)
                    .minimumScaleFactor(0.5)
            }
        }
        .buttonStyle(.plain)
    }
}

func getSmallWidgetSideLength() -> CGFloat {
    // Get the main screen size in portrait mode
    let screenSize: CGRect = UIScreen.main.bounds
    
    // Return corresponding small widget size
    // https://developer.apple.com/design/human-interface-guidelines/widgets#iOS-widget-dimensions
    switch (Int(screenSize.width), Int(screenSize.height)) {
        case (430, 932): return 170
        case (428, 926): return 170
        case (414, 896): return 169
        case (414, 736): return 159
        case (393, 852): return 158
        case (390, 844): return 158
        case (375, 812): return 155
        case (375, 667): return 148
        case (360, 780): return 155
        case (320, 568): return 141
        default: return 155
    }
}


#Preview("New Year") {
//    ModelContainerPreview(ModelContainer.sample) {
//        DiemGridItem(diem: .newYear)
//            .previewContext(WidgetPreviewContext(family: .systemSmall))
//    }
    NavigationStack {
        DiemGridItem(diem: .newYear)
            .modelContainer(previewContainer)
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}

#Preview("Independence Day") {
//    ModelContainerPreview(ModelContainer.sample) {
//        DiemGridItem(diem: .independenceDay)
//            .previewContext(WidgetPreviewContext(family: .systemSmall))
//    }
    
    NavigationStack {
        DiemGridItem(diem: .independenceDay)
            .modelContainer(previewContainer)
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
