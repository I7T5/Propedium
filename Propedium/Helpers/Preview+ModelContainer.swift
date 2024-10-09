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
        let container = try ModelContainer(
            for: Diem.self,
            configurations: ModelConfiguration(isStoredInMemoryOnly: true)
        )
        let modelContext = container.mainContext
        if try modelContext.fetch(FetchDescriptor<Diem>()).isEmpty {
            Diem.sampleDiems.forEach { container.mainContext.insert($0) }
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
