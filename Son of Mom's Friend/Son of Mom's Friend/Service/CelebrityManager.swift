//
//  CelebrityManager.swift
//  Son of Mom's Friend
//
//  Created by Артем Чжен on 01.11.2023.
//

import UIKit

class CelebrityManager {
    
    func getCelebrities(birthdate: Date?) -> [Celebrity] {
        if let savedCelebritiesData = UserDefaults.standard.data(forKey: "celebrities") {
            if let celebrities = try? JSONDecoder().decode([Celebrity].self, from: savedCelebritiesData) {
                var filterCelebrities = celebrities
                
                if let birthday = birthdate {
                    filterCelebrities = filterCelebrities.filter { $0.dateOfBirth == birthday }
                }
                return filterCelebrities
            }
        }
        return []
    }
    
    func getCelebrityId(id: Int) -> Celebrity? {
        if let savedCelebritiesData = UserDefaults.standard.data(forKey: "celebrities") {
            if let celebrities = try? JSONDecoder().decode([Celebrity].self, from: savedCelebritiesData) {
                return celebrities.first { $0.id == id }
            }
        }
        return nil
    }
}
