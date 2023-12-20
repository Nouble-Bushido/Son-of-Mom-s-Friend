//
//  AchievementResponse.swift
//  Son of Mom's Friend
//
//  Created by Артем Чжен on 20.12.2023.
//

import Foundation

enum AchievementResponse {
    static func map(from json: [String: Any]) -> [Achievement]? {
        guard let array = json["achievements"] as? [[String: Any]] else {
            return nil
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
        return result
    }
}
