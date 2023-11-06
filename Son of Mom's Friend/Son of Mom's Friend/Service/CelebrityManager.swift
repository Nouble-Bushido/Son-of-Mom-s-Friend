//
//  CelebrityManager.swift
//  Son of Mom's Friend
//
//  Created by Артем Чжен on 01.11.2023.
//

import UIKit

class CelebrityManager {
    
    func getCelebrities(birthdate: Date?) -> [Celebrity] {
        guard let savedCelebritiesData = UserDefaults.standard.data(forKey: "celebrities"),
              let celebrities = try? JSONDecoder().decode([Celebrity].self, from: savedCelebritiesData) else { return []}
        var filterCelebrities = celebrities
        
        if let birthday = birthdate {
            filterCelebrities = filterCelebrities.filter { $0.dateOfBirth == birthday }
        }
        
        return filterCelebrities
    }
    
    func getCelebrityId(id: Int) -> Celebrity? {
        guard let savedCelebritiesData = UserDefaults.standard.data(forKey: "celebrities"),
              let celebrities = try? JSONDecoder().decode([Celebrity].self, from: savedCelebritiesData) else { return nil }
        
        return celebrities.first { $0.id == id }
    }
}
