//
//  PlantRowView.swift
//  PlantApp
//
//  Created by Tasneem Awad on 02/06/1448 AH.
//

import SwiftUI

struct PlantRowView: View {
    var plant: Plant
    var viewModel: PlantViewModel

    var body: some View {
        HStack {
            Button {
                viewModel.toggleWatered(plant)
            }
            
            label: {
                Image(systemName: plant.isWatered ? "checkmark.circle.fill" : "circle")
                .foregroundStyle(plant.isWatered ? Color.mint : Color.white)
            .font(.title2) } .buttonStyle(.plain)
            
            VStack (alignment: .leading, spacing: 2) {
                HStack {
                    Image(systemName: "location")
                    Text("in \(plant.room)")
                }
                .foregroundStyle(.gray)
                .font(.caption)
                
                Text(plant.name)
                    .font(.title)
                HStack{
                    HStack {
                        Image(systemName: "sun.max")
                        Text(plant.light)
                        
                    }
                    .padding(.horizontal, 8)
                    .padding(.vertical, 3)
                    .background(Color.gray.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .font(.footnote)
                    .foregroundStyle(Color(red: 0.82, green: 0.72, blue: 0.38))
                    
                    HStack {
                        Image(systemName:"drop")
                        Text(plant.water)
                    } .padding(.horizontal, 8)
                        .padding(.vertical, 3)
                        .background(Color.gray.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .overlay {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.white.opacity(0.7), lineWidth: 1)
                                .opacity(plant.isWatered ? 0 : 1)
                        }
                        .font(.footnote)
                        .foregroundStyle(Color(red: 0.75, green: 0.87, blue: 0.95))
                }
            } .opacity(plant.isWatered ? 0.5 : 1)
        }
    }
}

#Preview {
    PlantRowView(
        plant: Plant(name: "Monstera", room: "Kitchen", light: "Full sun", wateringDays: "Every day", water: "20-50ml"),
        viewModel: PlantViewModel()
    )
    .preferredColorScheme(.dark)
}
