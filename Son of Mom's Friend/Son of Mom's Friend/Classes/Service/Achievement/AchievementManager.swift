//
//  AchievementManager.swift
//  Son of Mom's Friend
//
//  Created by Артем Чжен on 01.11.2023.
//

import Foundation

final class AchievementManager {
    enum Constants {
        static let achievements = "achievement_manager_achievements_key"
    }
}

// MARK: Public
extension AchievementManager {
    static func configure() {
        guard
            UserDefaults.standard.data(forKey: Constants.achievements) == nil,
            let url = Bundle.main.url(forResource: "Achievement", withExtension: "json"),
            let data = try? Data(contentsOf: url)
        else {
            return
        }
        UserDefaults.standard.set(data, forKey: Constants.achievements)
    }
    
    func getAchievements(age: Int?, celebrityId: Int?) -> [Achievement] {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd"
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard
            let data = UserDefaults.standard.data(forKey: Constants.achievements),
            let achievements = try? decoder.decode([Achievement].self, from: data)
        else {
            return []
        }
        
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
