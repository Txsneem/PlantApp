//
//  PlantViewModel.swift
//  PlantApp
//
//  Created by Tasneem Awad on 02/06/1448 AH.
//

import Observation

@Observable
class PlantViewModel {
    var plants: [Plant] = []
    
    func addPlant(_ plant: Plant) {
        plants.append(plant)
        
    }
    func toggleWatered(_ plant: Plant) {
        for index in plants.indices {
            if plants[index].id == plant.id {
                
                plants[index].isWatered.toggle()
            }
            
        }
        
    }
    var wateredCount: Int {
        var count = 0
        for plant in plants {
            if plant.isWatered {
                count += 1
            }
        }
        return count
    }
    
}
