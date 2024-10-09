//
//  DiemDetail.swift
//  Propedium
//
//  Created by 唐依纳 on 2024/1/10.
//

import SwiftUI
import SwiftData

struct DiemDetail: View {
    var diem: Diem
    
    @State private var presentingDiemEditor = false
    
    var body: some View {
            
        VStack(spacing: 0) {
            VStack(spacing: 0) {
                Text("\(diem.name)\(diem.daysDiff() < 0 ? "'s been" : " in")")
                    .frame(width: 300, height: 50)
                    .foregroundStyle(.white)
                .background(.accent)
                
                Text("\(abs(diem.daysDiff()))")
                    .font(.largeTitle)
                    .foregroundStyle(.black)
                    .frame(width: 300, height: 200)
                    .background(.white)
                    .shadow(radius: 0)
            }
            .padding()
            
            Text(toString(date: diem.date))
                .foregroundStyle(.secondary)
        }
        .shadow(radius: 7.5)
        .toolbar {

            ToolbarItem(placement: .principal) {
                Text(diem.name)
            }
            
            ToolbarItem(placement: .primaryAction) {
                Button {
                    presentingDiemEditor = true
                } label:{
                    Text("Edit")
                }
                .sheet(isPresented: $presentingDiemEditor) {
                    DiemEditor(diem: diem)
                }
            }
            
            ToolbarItemGroup(placement: .bottomBar) {
                Button {
                    
                } label: {
                    Image(systemName: "trash")
                        .foregroundStyle(.red)
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "square.and.arrow.up")
                }
            }
            
        }
    }
}

#Preview {
    ModelContainerPreview(ModelContainer.sample) {
        DiemDetail(diem: .christmas)
    }
    
//    DiemDetail(diem: .christmas)
//        .modelContainer(previewContainer)
    
}
