//
//  TabBarView.swift
//  Propedium
//
//  Created by 唐依纳 on 2024/1/9.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            FoldersView()
                .tabItem {
                    Label("Categories", systemImage: "folder")
                }
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "app")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "person.circle")
                }
        }
    }
}

#Preview {
    TabBarView()
        .modelContainer(previewContainer)
}
