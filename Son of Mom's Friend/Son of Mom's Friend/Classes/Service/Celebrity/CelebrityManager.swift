//
//  CelebrityManager.swift
//  Son of Mom's Friend
//
//  Created by Артем Чжен on 01.11.2023.
//

import Foundation

final class CelebrityManager {
    enum Constants {
        static let celebrities = "celebrities_manager_celebrities_key"
    }
}

// MARK: Public
extension CelebrityManager {
    static func configure() {
        guard
            UserDefaults.standard.data(forKey: Constants.celebrities) == nil,
            let url = Bundle.main.url(forResource: "Celebrity", withExtension: "json"),
            let data = try? Data(contentsOf: url),
            let jsonData = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
            let array = jsonData["celebrities"] as? [[String: Any]]
        else {
            return
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
        
        guard let encoded = try? JSONEncoder().encode(result) else { return }
        UserDefaults.standard.set(encoded, forKey: Constants.celebrities)
    }
    
    func getCelebrities(birthdate: Date? = nil) -> [Celebrity] {
           guard
               let data = UserDefaults.standard.data(forKey: Constants.celebrities),
               let celebrities = try? JSONDecoder().decode([Celebrity].self, from: data)
           else {
               return []
           }
           var filterCelebrities = celebrities
        
        if let birthday = birthdate {
            let todayComponets = Calendar.current.dateComponents([.day, .month], from: birthday)
            
              filterCelebrities = filterCelebrities.filter {
                  
                  let celebrityComponents = Calendar.current.dateComponents([.day, .month], from: $0.dateOfBirth)
                  return celebrityComponents.day == todayComponets.day && celebrityComponents.month == todayComponets.month
              }
          }
           return filterCelebrities
       }
    
    func getCelebrity(id: Int) -> Celebrity? {
        getCelebrities().first { $0.id == id }
    }
}
