//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by ROLF J. on 8/30/24.
//

import SwiftUI

struct FavoriteButton: View {
    // @Binding property wrapper enables you to read and write between a property that stores data and a view that displays and changed the data
    @Binding var isSet: Bool
    
    var body: some View {
        // Make the view to 'Button' property
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundStyle(isSet ? .yellow : .gray)
        }
    }
}


#Preview {
    FavoriteButton(isSet: .constant(true))
}
