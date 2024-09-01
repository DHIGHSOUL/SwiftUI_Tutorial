//
//  LandmarkList.swift
//  Landmarks
//
//  Created by ROLF J. on 8/27/24.
//

import SwiftUI

struct LandmarkList: View {
    // @Environment <<-- This is 'property wrapper'
    // To use this wrapper, use 'environment(_:) modifier' to the preview
    @Environment(ModelData.self) var modelData
    // Because State properties to hold information that's specific to a view and it's subview, have to always create state as private
    @State private var showFavoritesOnly = false
    
    var filterdLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            // If showFavoritesOnly state is false(default state) -> all instances of landmark.isFavorite is 'true'
            // On the other way, if showFavoritesOnly state is true -> only 'landmark.isFavorite' instances are 'true'
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        // NavigationSplitView takes a second input that's a placeholder for the view that appears after someone makes a selection
        NavigationSplitView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                ForEach(filterdLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .animation(.default, value: filterdLandmarks)
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark")
        }
        
//        List(landmarks, id: \.id) { landmark in
//            LandmarkRow(landmark: landmark)
//        }
        
//        List {
//            LandmarkRow(landmark: landmarks[0])
//            LandmarkRow(landmark: landmarks[1])
//        }
    }
}

#Preview {
    LandmarkList()
        .environment(ModelData())
}
