//
//  DiemWidgetIntent.swift
//  PropediumWidgetExtension
//
//  Created by 唐依纳 on 2023/11/9.
//

/*
Reference: https://developer.apple.com/documentation/swiftui/backyard-birds-sample
See the LICENSE.txt file for this sample’s licensing information.
*/

import WidgetKit
import AppIntents
import SwiftData
import OSLog

private let logger = Logger(subsystem: "Widgets", category: "DiemWidgetIntent")

struct DiemWidgetIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Diem"
    static var description = IntentDescription("Keeps track of a diem.")

    // TODO: assign default diem
    @Parameter (title: "Diem")
    var diem: DiemEntity
    
    init(diem: DiemEntity) {
        self.diem = diem
    }

    init() {}
    
    static var parameterSummary: some ParameterSummary {
        Summary {
            \.$diem
        }
    }
}

//extension DiemWidgetIntent {
//    static var smiley: DiemWidgetIntent {
//        let intent = DiemWidgetIntent()
//        intent.diem = "😀"
//        return intent
//    }
//    
//    static var starEyes: DiemWidgetIntent {
//        let intent = DiemWidgetIntent()
//        intent.diem = "🤩"
//        return intent
//    }
//}

extension DiemWidgetIntent {
    static var christmas: DiemWidgetIntent {
        let intent = DiemWidgetIntent()
        intent.diem = .init(from: .christmas)
        return intent
    }
    
    static var independenceDay: DiemWidgetIntent {
        let intent = DiemWidgetIntent()
        intent.diem = .init(from: .independenceDay)
        return intent
    }
}

struct DiemEntity: AppEntity, Identifiable, Hashable {
    var name: String
    var date: Date
    var detail: String?
    
    var id: String {
        name
    }
    
    func daysDiff() -> Int {
        return Calendar.current.dateComponents([.day], from: Date(), to: date).day!
    }

    init(name: String, date: Date) {
        self.name = name
        self.date = date
    }

    init(from diem: Diem) {
        name = diem.name
        date = diem.date
    }

    var displayRepresentation: DisplayRepresentation {
        DisplayRepresentation(title: "\(name)")
    }

    static var typeDisplayRepresentation = TypeDisplayRepresentation(name: "Diem")
    static var defaultQuery = DiemEntityQuery()
}

struct DiemEntityQuery: EntityQuery, Sendable {
    // Reference: https://github.com/pawello2222/WidgetExamples/blob/main/Widgets/DynamicIntentWidget
//    func entities(for identifiers: [DiemEntity.ID]) async throws -> [DiemEntity] {
//        Diem.getAll()
//            .filter { identifiers.contains($0.id) }
//            .map(DiemEntity.init)
//    }
//
//    func suggestedEntities() async throws -> [DiemEntity] {
//        Diem.getAll().map(DiemEntity.init)
//    }
    
    // Reference: https://developer.apple.com/documentation/swiftui/backyard-birds-sample
    func entities(for identifiers: [DiemEntity.ID]) async throws -> [DiemEntity] {
        logger.info("Loading backyards for identifiers: \(identifiers)")
        // Replaced `DataGeneration.container` with `try! ModelContainer(for: Diem.self)`
        let modelContext = ModelContext(try! ModelContainer(for: Schema([Diem.self])))
        let diems = try! modelContext.fetch(FetchDescriptor<Diem>(predicate: #Predicate { identifiers.contains($0.id) }))
        logger.info("Found \(diems.count) diems")
        return diems.map { DiemEntity(from: $0) }
    }
    
    func suggestedEntities() async throws -> [DiemEntity] {
        logger.info("Loading backyards to suggest for specific backyard...")
        let modelContext = ModelContext(try! ModelContainer(for: Schema([Diem.self])))
        let diems = try! modelContext.fetch(FetchDescriptor<Diem>())
        logger.info("Found \(diems.count) diems")
        return diems.map { DiemEntity(from: $0) }
    }
}
