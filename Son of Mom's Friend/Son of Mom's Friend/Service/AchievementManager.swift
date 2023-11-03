//
//  AchievementManager.swift
//  Son of Mom's Friend
//
//  Created by Артем Чжен on 01.11.2023.
//

import UIKit

class AchievementManager {
    
    func getAchievements(age: Int?, celebrityId: Int?) -> [Achievement] {   
        if let savedAchievementsData = UserDefaults.standard.data(forKey: "achievements") {
            if let achievements = try? JSONDecoder().decode([Achievement].self, from: savedAchievementsData) {
                var filteredAchievements = achievements

                if let ageAchievement = age {
                    filteredAchievements = filteredAchievements.filter { $0.ageAtAchievement == ageAchievement }
                }

                if let celebrityId = celebrityId {
                    filteredAchievements = filteredAchievements.filter { $0.celebrityId == celebrityId }
                }

                return filteredAchievements
            }
        }
        
        return []
    }
}
