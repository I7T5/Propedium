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
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(Diem.sharedModelContainer)
        }
    }
}
