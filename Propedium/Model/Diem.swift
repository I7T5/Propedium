//
//  Diem.swift
//  Propedium
//
//  Created by 唐依纳 on 2023/10/18.
//

import Foundation
import SwiftUI

struct Diem: Hashable, Codable {
    var id: Int
    var name: String
    var date: String
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
}
