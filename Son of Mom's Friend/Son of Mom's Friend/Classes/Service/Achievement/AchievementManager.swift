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
            let array = jsonData["achievements"] as? [[String: Any]]
        else {
            return
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        
        let result = array.compactMap { json -> Achievement? in
            guard
                let id = json["id"] as? Int,
                let date = json["date"] as? String,
                let dateAchiev = dateFormatter.date(from: date),
                let celebrityId = json["celebrityId"] as? Int,
                let description = json["description"] as? String,
                let ageAtAchievement = json["ageAtAchievement"] as? Int
            else {
                return nil
            }
            let achievement = Achievement(
                id: id,
                date: dateAchiev,
                celebrityId: celebrityId,
                description: description,
                ageAtAchievement: ageAtAchievement
            )
            return achievement
        }
        guard let encoded = try? JSONEncoder().encode(result) else { return }
        
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
