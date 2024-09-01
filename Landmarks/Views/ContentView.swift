//
//  ContentView.swift
//  Landmarks
//
//  Created by ROLF J. on 8/26/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
