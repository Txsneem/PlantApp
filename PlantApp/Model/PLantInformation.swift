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
    
}
