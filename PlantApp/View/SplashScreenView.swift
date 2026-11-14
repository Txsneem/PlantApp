//
//  SplashScreenView.swift
//  PlantApp
//
//  Created by Tasneem Awad on 30/05/1448 AH.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var showSheet = false
    @State private var viewModel = PlantViewModel()
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
            
            VStack{
                HStack{
                    Text("My Plants 🌱")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .padding(.leading, 20)
                    
                        Spacer()
                }
                Divider()
                    .overlay(Color.gray)
                
                if viewModel.plants.isEmpty {
                    Image(systemName: "leaf")
                        .font(.system(size:100))
                        .foregroundStyle(.green)
                        .padding(.top, 130)
                    
                    Text("Start your plant journey!")
                        .font(.title)
                        .foregroundStyle(.white)
                        .padding(.top, 20)
                    
                    Text("Now all your plants will be in one place and \n we will help you take care of them :)🪴")
                        .padding(.top, 5)
                        .frame(maxWidth: 500)
                        .font(.headline)
                        .foregroundStyle(.gray)
                        .foregroundStyle(Color(red: 0.90, green: 0.70, blue: 0.65))
                    
                    Button("Set Plant Reminder") {
                        //i will add the action later
                        showSheet = true
                    }
                    .padding(.horizontal, 66)
                    .padding(.vertical, 10)
                    .background(Color(red: 0.25, green: 0.48, blue: 0.38))
                    .glassEffect(.regular.tint(.green),
                                 in: RoundedRectangle(cornerRadius:40))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                    .padding(.top, 100)
                    
                
            } else if viewModel.allWatered {
               Spacer()
                VStack(spacing: 8){
                    Text("All Done! 🎉")
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                        .font(.title)
                    Text("All Reminders Completed")
                        .foregroundStyle(.gray)
                }
            }
                else {
                    VStack {
                        Text(viewModel.wateredCount == 0 ? "Your plants are waiting for a sip 💦" : "\(viewModel.wateredCount) of your plants feel loved today ✨")
                            .foregroundStyle(.white)
                            .padding(.top, 28)
                        
                        ProgressView(value: Double(viewModel.wateredCount), total: Double(viewModel.plants.count))
                            .tint(.mint)
                            .scaleEffect(x: 1, y: 2)
                            .padding(.horizontal, 24)
                        
                            .padding(.bottom, 22)
                        List(viewModel.plants) { plant in
                            PlantRowView(plant: plant, viewModel: viewModel)
                                .alignmentGuide(.listRowSeparatorLeading) { _ in 0 }
                                .swipeActions {
                                    Button(role: .destructive) {
                                        viewModel.deletePlant(plant)
                                    } label: {
                                        Image(systemName: "trash")
                                    }
                                }
                        }
                        .listStyle(.plain)
                        .scrollContentBackground(.hidden)
                        
                    }
                }

                Spacer()
                
            } .overlay(alignment: .bottomTrailing) {
                if !viewModel.plants.isEmpty {
                    AddPlantButton {
                        showSheet = true
                    }
                    
                }
                
            }
             
    
        } .sheet(isPresented: $showSheet) {
            SetReminderView(viewModel: viewModel)
        }
        
    }
}

#Preview {
    SplashScreenView()
}
