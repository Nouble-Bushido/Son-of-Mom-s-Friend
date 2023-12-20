//
//  Celebrity.swift
//  Son of Mom's Friend
//
//  Created by Артем Чжен on 26.10.2023.
//

import Foundation

struct Celebrity: Codable {
    var id: Int
    var name: String
    var biography: String
    var mainAchievement: String
    var dateOfBirth: Date
    var photoURL: String
    var achievementIDs: [Int]
}
