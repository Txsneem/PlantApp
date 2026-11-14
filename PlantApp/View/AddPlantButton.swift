//
//  AddPlantButton.swift
//  PlantApp
//
//  Created by Tasneem Awad on 04/06/1448 AH.
//

import SwiftUI

struct AddPlantButton: View {
    var action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: "plus")
                .frame(width: 48, height: 48)
                .glassEffect(.regular.tint(Color(red: 0.29, green: 0.5, blue: 0.41)))
                .foregroundStyle(.white)
                .fontWeight(.bold)
                .font(.title2)
            
        }
        .padding()
    }
}

#Preview {
    AddPlantButton(action: {})
        .preferredColorScheme(.dark)
}
