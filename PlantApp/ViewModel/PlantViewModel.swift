//
//  PlantViewModel.swift
//  PlantApp
//
//  Created by Tasneem Awad on 02/06/1448 AH.
//

import Observation
import UserNotifications

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
    
    var allWatered: Bool {
        !plants.isEmpty && wateredCount == plants.count
    }
    
    func deletePlant(_ plant: Plant) {
        cancelReminders(for: plant)
        plants.removeAll { item in
            item.id == plant.id
        }
    }
    
    func updatePlant(_ updated: Plant) {
        for index in plants.indices {
            if plants[index].id == updated.id {
                plants[index] = updated
            }
        }
        cancelReminders(for: updated)
        scheduleReminder(for: updated)
    }
    
    func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, error in
            print("Permission granted: \(granted)")
        }
    }
    
    func scheduleReminder(for plant: Plant) {
        let content = UNMutableNotificationContent()
        content.title = "Planto"
        content.body = "Hey! let's water your plant"
        content.sound = .default
        
        if plant.daysBetweenWatering == 1 {
            var time = DateComponents()
            time.hour = 10
            time.minute = 0
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: time, repeats: true)
            let request = UNNotificationRequest(identifier: plant.id.uuidString, content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request)
        } else {
            for occurrence in 1...10 {
                let daysAhead = occurrence * plant.daysBetweenWatering
                
                if let date = Calendar.current.date(byAdding: .day, value: daysAhead, to: Date()) {
                    var time = Calendar.current.dateComponents([.year, .month, .day], from: date)
                            time.hour = 10
                            time.minute = 0
                    
                    let trigger = UNCalendarNotificationTrigger(dateMatching: time, repeats: false)
                            let request = UNNotificationRequest(identifier: "\(plant.id.uuidString)-\(occurrence)", content: content, trigger: trigger)
                            UNUserNotificationCenter.current().add(request)
                }
            }
        }
    }
    
    func cancelReminders(for plant: Plant) {
        var identifiers = [plant.id.uuidString]

        for occurrence in 1...10 {
            identifiers.append("\(plant.id.uuidString)-\(occurrence)")
        }

        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: identifiers)
    }
    
}
