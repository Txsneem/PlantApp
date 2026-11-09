//
//  SetReminderView.swift
//  PlantApp
//
//  Created by Tasneem Awad on 01/06/1448 AH.
//

import SwiftUI

struct SetReminderView: View {
    
    @Environment(\.dismiss) private var dismiss
    var viewModel: PlantViewModel
    @State private var plantName = ""
    @State private var room = "Bedroom"
    let rooms = ["Bedroom", "Kitchen", "Living room"]
    @State private var light = "Full sun"
    let lights = ["Full sun", "Partial sun", "Low light"]
    @State private var wateringDay = "Every day"
    let wateringDays = ["Every day", "Every 2 days", "Every 3 days", "Once a week"]
    @State private var water = "20-50 ml"
    let waters = ["20-50 ml", "50-100 ml", "100-200 ml", "200-300 ml"]
   
    var body: some View {
        VStack (spacing: 40){
            HStack {
                Button {
                    dismiss()
                    //i will add the action later
                    
                } label: {
                    Image(systemName: "xmark")
                        .frame(width: 44, height: 44)
                        .glassEffect()
                        .foregroundStyle(.white)
                }
                
                Spacer()
                
                Text("Set Reminder")
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button {
                    //adding action later
                    let newPlant = Plant(name: plantName, room: room, light: light, wateringDays: wateringDay, water: water)
                    viewModel.addPlant(newPlant)
                    dismiss()
                } label: {
                    Image(systemName: "checkmark")
                        .frame(width: 44, height: 44)
                        .glassEffect(.regular.tint(Color(red: 0.29, green: 0.5, blue: 0.4)))
                        .foregroundStyle(.white)
                }
            } .padding(.horizontal)
                .padding(.top)
            
            HStack {
                Text("Plant Name")
                TextField("Pothos", text: $plantName)
                    .tint(.green)
            }
            .padding()
            .background(Color.gray.opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .padding(.horizontal) //pushes the  element from the left and right
            
            VStack(spacing: 8){
                HStack {
                    Image(systemName: "location")
                    Text("Room")
                    Spacer()
                    Picker("Room", selection: $room) {
                        ForEach(rooms, id: \.self) { name in
                            Text(name)
                            
                        }
                    } .tint(.gray)
                }
                Divider()
                HStack {
                    Image(systemName: "sun.max")
                    Text("Light")
                    Spacer()
                    Picker("Light", selection: $light){
                        ForEach(lights, id: \.self) { option in
                            Text(option)
                        }
                    } .tint(.gray)
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.gray.opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .padding(.horizontal)
            
            VStack(spacing: 8){
                HStack {
                    Image(systemName: "drop")
                    Text("Watering Days")
                    Spacer()
                    Picker("Watering Days", selection: $wateringDay) {
                        ForEach(wateringDays, id: \.self) { day in
                            Text(day)
                        }
                    } .tint(.gray)
                }
                Divider()
                HStack {
                    Image(systemName: "drop")
                    Text("Water")
                    Spacer()
                    Picker("Water", selection: $water) {
                        ForEach(waters, id: \.self) { Option in
                            Text(Option)
                        }
                        
                    } .tint(.gray)
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.gray.opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .padding(.horizontal)
           
            Spacer()
        } .ignoresSafeArea(.keyboard)
    }
}

#Preview {
    SetReminderView(viewModel: PlantViewModel())
        .preferredColorScheme(.dark)
}
