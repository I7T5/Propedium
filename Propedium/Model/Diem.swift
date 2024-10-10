//
//  Diem.swift
//  Propedium
//
//  Created by 唐依纳 on 2023/10/18.
//

import Foundation
import SwiftData

// TODO: Sync with iCloud
@Model class Diem: Codable, Hashable, Identifiable {
    @Attribute(.unique) var name: String
//    var id: String
    var id: String {
        name
    }
    var date: Date  // TODO: time, option to display hours, minutes, seconds (if time not specified, by default 00:00)
    var detail: String?
    // TODO: repeating events
    // TODO: tags list, DiemTag SwiftData model
    // TODO: lunar calendar date boolean
    // TODO: notification settings (big days, custom message)
    
    /** TODO: DiemStyle
    - font (family, size, weight, color)
      - provided: Default (system), Narrow, Serif, Rounded
      - load external font and choose weight, size
      - color
    - layout
    - background
      - color(s) (gradient)  (or just white and black for simplicity of the app)
      - photo (croppable)
        - brightness
        - isBlurred
     */
    
    
    init(name: String, date: Date) {
        self.name = name
        self.date = date
//        self.id = UUID().uuidString
    }
    
    // For Widget intent
    init(entity: DiemEntity) {
        self.name = entity.name
        self.date = entity.date
        self.detail = entity.detail
//        self.id = entity.id
    }
    
    func daysDiff() -> Int {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd"
        return Calendar.current.dateComponents([.day], from: Date(), to: date).day!
    }
    
    // Conform to Codable manually
    enum CodingKeys: CodingKey {
        case name, date
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(date, forKey: .date)
//        try container.encode(id, forKey: .id)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        date = try container.decode(Date.self, forKey: .date)
//        id = try container.decode(String.self, forKey: .id)
    }
}

extension Diem {
    static let christmas: Diem = .init(
        name: "Christmas",
        date: createDate(month: 12, day: 25)
    )
}
