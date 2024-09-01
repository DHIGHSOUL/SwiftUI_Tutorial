//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by ROLF J. on 8/26/24.
//

import SwiftUI
import SwiftData

@main
struct LandmarksApp: App {
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
