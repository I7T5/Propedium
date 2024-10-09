/*
See the AppleLicense.txt file for this sample’s licensing information.

Abstract:
An extension that creates a sample model container to use when previewing
 views in Xcode.
*/


import SwiftData

@MainActor
let previewContainer: ModelContainer = {
    do {
        let schema = Schema([Diem.self])
        let container = try ModelContainer(
            for: Diem.self,
            configurations: ModelConfiguration(isStoredInMemoryOnly: true)
        )
        let modelContext = container.mainContext
        if try modelContext.fetch(FetchDescriptor<Diem>()).isEmpty {
            Diem.sampleDiems.forEach { modelContext.insert($0) }
        }
        return container
    } catch {
        fatalError("Failed to create container")
    }
}()

//extension ModelContainer {
//    static var sample: () throws -> ModelContainer = {
//        let schema = Schema([Diem.self])
//        let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
//        let container = try ModelContainer(for: schema, configurations: [configuration])
//        Task { @MainActor in
//            Diem.insertSampleData(modelContext: container.mainContext)
//        }
//        return container
//    }
//}
//
//extension Diem {
//    static func insertSampleData(modelContext: ModelContext) {
//        // Add the Diems to the model context.
//        for diem in Diem.sampleDiems {
//            modelContext.insert(diem)
//        }
//    }
//}
