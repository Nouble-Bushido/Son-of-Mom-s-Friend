//
//  CelebrityResponse.swift
//  Son of Mom's Friend
//
//  Created by Артем Чжен on 20.12.2023.
//

import Foundation

enum CelebrityResponse {
    static func map(from json: [String: Any]) -> [Celebrity]? {
        guard let array = json["celebrities"] as? [[String: Any]] else {
            return nil
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        
        let result = array.compactMap { json -> Celebrity? in
            guard
                let id = json["id"] as? Int,
                let name = json["name"] as? String,
                let biography = json["biography"] as? String,
                let mainAchievement = json["mainAchievement"] as? String,
                let photoURL = json["photoURL"] as? String,
                let dateOfBirthString = json["dateOfBirth"] as? String,
                let dateOfBirth = dateFormatter.date(from: dateOfBirthString),
                let achievementIDs = json["achievementIDs"] as? [Int]
            else {
                return nil
            }
            
            let celebrity = Celebrity(
                id: id,
                name: name,
                biography: biography,
                mainAchievement: mainAchievement,
                dateOfBirth: dateOfBirth,
                photoURL: photoURL,
                achievementIDs: achievementIDs
            )
            return celebrity
        }
        
        return result
    }
}
