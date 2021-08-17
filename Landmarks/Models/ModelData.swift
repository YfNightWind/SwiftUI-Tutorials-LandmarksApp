//
//  ModelData.swift
//  Landmarks
//
//  Created by Alex Lin on 2021/8/11.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var landmarks: [Landmark] = load("landmarkData.json")
}

var landmarks : [Landmark] = load("landmarkData.json")
// 这里不可以省略<T: Decodable>，不可以设置函数返回类型为Decodable，不然会在return的时候报下面这个错误👇
// Protocol 'Decodable' as a type cannot conform to the protocol itself
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
