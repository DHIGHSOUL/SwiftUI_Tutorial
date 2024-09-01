//
//  ModelData.swift
//  Landmarks
//
//  Created by ROLF J. on 8/27/24.
//

import Foundation

// @Observable <<-- This is 'Observable()' macro
// SwiftUI updates a view only when an observable properties change and the views' body read the property directly
// So in this case, this macro is for when landmark properties are change, than this application should to know about it
@Observable
class ModelData {
    // Import landmarkData.json and make it to <List>
    var landmarks: [Landmark] = load("landmarkData.json")
    var hikes: [Hike] = load("hikeData.json")
}


// 'load' function require Decodable List 'T'
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    // Convert file to Data datatype
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    // Use JsonDecoder and make Data to 'T', the List
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
