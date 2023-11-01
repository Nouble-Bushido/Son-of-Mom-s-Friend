//
//  CelebrityManager.swift
//  Son of Mom's Friend
//
//  Created by Артем Чжен on 01.11.2023.
//

import UIKit

class CelebrityManager {
    private var celebrites: [Celebrity] = []

    func getCelebrities(birthdate: Date?) -> [Celebrity] {
        var filterCelebrities: [Celebrity] = []
        
        for celebrite in celebrites {
            if let filterBirthday = birthdate, celebrite.dateOfBirth == filterBirthday {
                filterCelebrities.append(celebrite)
            }
        }
        return filterCelebrities
    }
    
    func getCelebrityId(id: Int) -> Celebrity? {
        for celebrite in celebrites {
            if celebrite.id == id {
                return celebrite
            }
        }
        return nil
    }
}
