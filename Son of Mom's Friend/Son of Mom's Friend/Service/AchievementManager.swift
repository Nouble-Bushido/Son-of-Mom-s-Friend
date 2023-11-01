//
//  AchievementManager.swift
//  Son of Mom's Friend
//
//  Created by Артем Чжен on 01.11.2023.
//

import UIKit

class AchievementManager {
    var achievements: [Achievement] = []
    
    func getAchievements(age: Int?, celebrityId: Int?) -> [Achievement] {
        var filterAchievements: [Achievement] = []
        
        for achievement in achievements {
            if let ageAchievement = age, achievement.ageAtAchievement == ageAchievement {
                filterAchievements.append(achievement)
            }
            if let celebrityId = celebrityId, achievement.celebrityId == celebrityId {
                filterAchievements.append(achievement)
            }
        }
        return filterAchievements
    }
}
