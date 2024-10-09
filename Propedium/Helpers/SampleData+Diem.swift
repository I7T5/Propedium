/*
See the AppleLicense.txt file for this sample’s licensing information.

Abstract:
An extension that creates animal instances for use as sample data.
*/

import Foundation
import SwiftData

extension Diem {
    static let newYear: Diem = .init(
        name: "New Year",
        date: createDate(year: 2025, month: 01, day: 01)
    )
    
    static let easter: Diem = .init(
        name: "Easter",
        date: createDate(year: 2024, month: 3, day: 31)
    )
    
    static let aprilFools: Diem = .init(
        name: "April Fools Day",
        date: createDate(year: 2024, month: 4, day: 1)
    )
    
    static let mayFourth: Diem = .init(
        name: "May the Fourth",
        date: createDate(year: 2024, month: 5, day: 4)
    )
    
    static let childrensDay: Diem = .init(
        name: "Children's Day",
        date: createDate(year: 2024, month: 6, day: 1)
    )
    
    static let independenceDay: Diem = .init(
        name: "Independence Day",
        date: createDate(year: 2024, month: 7, day: 4)
    )
    
    static let myBirthday: Diem = .init(
        name: "My Birthday",
        date: createDate(year: 2024, month: 7, day: 5)
    )
    
    static let laborDay: Diem = .init(
        name: "Labor Day",
        date: createDate(year: 2024, month: 9, day: 4)
    )
    
    static let thanksgiving: Diem = .init(
        name: "Thanksgiving",
        date: createDate(year: 2024, month: 11, day: 24)
    )
    
    static let christmas: Diem = .init(
        name: "Christmas",
        date: createDate(year: 2024, month: 12, day: 25)
    )
}

extension Diem {
    static let sampleDiems: [Diem] = [
        .newYear, .easter, .aprilFools, .mayFourth, .childrensDay, .independenceDay, .myBirthday, .laborDay, .thanksgiving, .christmas
    ]
}

//extension Diem {
//    static func insertSampleData(modelContext: ModelContext) {
//        // Add the Diems to the model context.
//        for diem in Diem.sampleDiems {
//            modelContext.insert(diem)
//        }
//    }
//}

//// MARK: - Helpers
//// The MIT License (MIT) Copyright (c) 2020-Present Paweł Wiszenko
//
//extension Diem {
//    static func getAll() -> [Diem] {
//        let key = UserDefaultKey.diems
//        guard let diems: [Diem] = UserDefaults.appGroup.getArray(forKey: key) else {
//            let diems: [Diem] = Diem.sampleDiems
//            UserDefaults.appGroup.setArray(diems, forKey: key)
//            return diems
//        }
//        return diems
//    }
//}
//
//// MARK: UserDefaults
//enum Shared {
//    static let appGroupName = "group.com.I7T5.Propedium"
////    static let luckyNumberFilename = "LuckyNumber.txt"
//}
//
//extension UserDefaults {
//    func setArray<Element>(_ array: [Element], forKey key: String) where Element: Encodable {
//        let data = try? JSONEncoder().encode(array)
//        set(data, forKey: key)
//    }
//
//    func getArray<Element>(forKey key: String) -> [Element]? where Element: Decodable {
//        guard let data = data(forKey: key) else {
//            return nil
//        }
//        return try? JSONDecoder().decode([Element].self, from: data)
//    }
//}
//
//extension UserDefaults {
//    static let appGroup = UserDefaults(suiteName: Shared.appGroupName)!
//}
//
//
//enum UserDefaultKey {
//    static var luckyNumber: String { #function }
//    static var diems: String { #function }
//
//    static func eventCounter(id: Int) -> String {
//        "eventCounter-\(id)"
//    }
//}
