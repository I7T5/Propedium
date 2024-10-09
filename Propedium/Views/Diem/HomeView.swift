//
//  HomeView.swift
//  Propedium
//
//  Created by 唐依纳 on 2024/1/10.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @Query(sort: \Diem.date) 
    private var diems: [Diem]
    
    @State private var presentingDiemEditor = false
    
    var body: some View {
        NavigationStack {
            DiemsGrid()
                .navigationTitle("Gallery")  // TODO: Display pinned
            // \(diems.first == nil ? "Diems" : "\(diems.first!.daysDiff()) days until/since \(diems.first!.name)")
                .navigationDestination(for: Diem.ID.self) { diemID in
                    if let diem = diems.first(where: { $0.id == diemID }) {
                        DiemDetail(diem: diem)
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        Button {
                            presentingDiemEditor = true
                        } label:{
                            Image(systemName: "plus")
                                .foregroundColor(.accentColor)
                        }
                        .sheet(isPresented: $presentingDiemEditor) {
                            DiemEditor(diem: nil)
                        }
                    }
                }
            
            
            // TODO: Show add diem view when scrolling to bottom

        }
    }
}

#Preview {
//    ModelContainerPreview(ModelContainer.sample) {
//        HomeView()
//    }
    
    HomeView()
        .modelContainer(previewContainer)
}
