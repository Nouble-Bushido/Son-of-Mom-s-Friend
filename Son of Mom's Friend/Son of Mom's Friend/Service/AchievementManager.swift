//
//  AchievementManager.swift
//  Son of Mom's Friend
//
//  Created by Артем Чжен on 01.11.2023.
//

import UIKit

class AchievementManager {
    
    func getAchievements(age: Int?, celebrityId: Int?) -> [Achievement] {
        guard let savedAchievementsData = UserDefaults.standard.data(forKey: "achievements"),
              let achievements = try? JSONDecoder().decode([Achievement].self, from: savedAchievementsData) else { return [] }
        var filteredAchievements = achievements
        
        if let ageAchievement = age {
            filteredAchievements = filteredAchievements.filter { $0.ageAtAchievement == ageAchievement }
        }
        
        if let celebrityId = celebrityId {
            filteredAchievements = filteredAchievements.filter { $0.celebrityId == celebrityId }
        }
        
        return filteredAchievements
    }
    
    static func configure() {
        guard UserDefaults.standard.data(forKey: "celebrities") == nil else { return }
        if let url = Bundle.main.url(forResource: "achievements", withExtension: "json"),
           let data = try? Data(contentsOf: url),
           let achievements = try? JSONDecoder().decode([Achievement].self, from: data) {
            let encodedData = try? JSONEncoder().encode(achievements)
            UserDefaults.standard.set(encodedData, forKey: "achievements")
        }
    }
}
