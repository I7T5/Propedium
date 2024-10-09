//
//  ContentView.swift
//  Propedium
//
//  Created by 唐依纳 on 2023/10/18.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        HomeView()
    }
}

#Preview {
//    ModelContainerPreview(ModelContainer.sample) {
//        ContentView()
//    }
    
    ContentView()
        .modelContainer(previewContainer)
}
