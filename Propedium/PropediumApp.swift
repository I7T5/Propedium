//
//  PropediumApp.swift
//  Propedium
//
//  Created by 唐依纳 on 2023/10/18.
//

import SwiftUI
import SwiftData

@main
struct PropediumApp: App {
    // https://stackoverflow.com/q/77736292/19374566
    let container: ModelContainer
    init() {
        do {
            container = try ModelContainer(for: Diem.self)
        } catch {
            fatalError("Could not initialize ModelContainer")
        }
//        let modelContext = ModelContext(container)
//        modelContext.insert(Diem.christmas)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Diem.self)
        }
    }
}
