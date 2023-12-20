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
            let data = try? Data(contentsOf: url),
            let jsonData = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
            let achievementArray = AchievementResponse.map(from: jsonData)
        else {
            return
        }
        guard let encoded = try? JSONEncoder().encode(achievementArray) else { return }
        
        UserDefaults.standard.setValue(encoded, forKey: Constants.achievements)
    }
    
    func getAchievements() -> [Achievement] {
        guard
            let data = UserDefaults.standard.data(forKey: Constants.achievements),
            let achievements = try? JSONDecoder().decode([Achievement].self, from: data)
        else {
            return []
        }
        
        let filteredAchievements = achievements
        return filteredAchievements
    }
}
