//
//  PlantAppApp.swift
//  PlantApp
//
//  Created by Tasneem Awad on 29/05/1448 AH.
//

import SwiftUI

@main
struct PlantAppApp: App {
    var body: some Scene {
        WindowGroup {
            MyPlantsView()
                .preferredColorScheme(.dark)
        }
        
    }
}
