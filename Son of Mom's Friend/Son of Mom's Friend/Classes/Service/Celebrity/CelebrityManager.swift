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
            let data = try? Data(contentsOf: url)
        else {
            return
        }
        UserDefaults.standard.set(data, forKey: Constants.celebrities)
    }
    
    func getCelebrities(birthdate: Date? = nil) -> [Celebrity] {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd"
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard
            let data = UserDefaults.standard.data(forKey: Constants.celebrities),
            let celebrities = try? decoder.decode([Celebrity].self, from: data)
        else {
            print("No Data")
            return []
        }
        
        var filterCelebrities = celebrities
        
        if let birthday = birthdate {
            filterCelebrities = filterCelebrities.filter { $0.dateOfBirth == birthday }
        }
        return filterCelebrities
    }
    
    func getCelebrity(id: Int) -> Celebrity? {
        getCelebrities().first { $0.id == id }
    }
}
