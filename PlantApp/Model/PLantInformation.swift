//
//  PLantInformation.swift
//  PlantApp
//
//  Created by Tasneem Awad on 01/06/1448 AH.
//
import Foundation

struct Plant: Identifiable {
    var id = UUID()
    var name: String
    var room: String
    var light: String
    var wateringDays: String
    var water: String
    var isWatered: Bool = false
    
    var daysBetweenWatering: Int {
        switch wateringDays {
        case "Every day":
            return 1
        case "Every 2 days":
            return 2
        case "Every 3 days":
            return 3
        case "Once a week":
            return 7
        case "Every 10 days":
            return 10
        case "Every 2 weeks":
            return 14
        default:
            return 1
        }
    }
    
}
