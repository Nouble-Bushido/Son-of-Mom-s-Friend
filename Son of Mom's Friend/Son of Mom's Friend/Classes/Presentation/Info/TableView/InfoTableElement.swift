//
//  InfoTableElement.swift
//  Son of Mom's Friend
//
//  Created by Артем Чжен on 13.01.2024.
//

import Foundation

enum InfoTableElement {
    case celebrityInfo(Celebrity)
    case biographyName(String)
    case biographyInfo(Celebrity)
    case achievemntName(String)
    case achievementInfo(Celebrity, Achievement)
}
