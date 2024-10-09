//
//  ModelData.swift
//  Propedium
//
//  Created by 唐依纳 on 2023/10/18.
//


// https://developer.apple.com/tutorials/swiftui/building-lists-and-navigation

//import Foundation
//
//var diems: [Diem] = load("diemData.json")
//
//func load<T: Decodable>(_ filename: String) -> T {
//    let data: Data
//
//
//    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
//    else {
//        fatalError("Couldn't find \(filename) in main bundle.")
//    }
//
//
//    do {
//        data = try Data(contentsOf: file)
//    } catch {
//        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
//    }
//
//
//    do {
//        let decoder = JSONDecoder()
//        return try decoder.decode(T.self, from: data)
//    } catch {
//        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
//    }
//}
