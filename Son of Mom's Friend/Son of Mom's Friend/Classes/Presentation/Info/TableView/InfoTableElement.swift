//
//  InfoTableElement.swift
//  Son of Mom's Friend
//
//  Created by Артем Чжен on 13.01.2024.
//

import Foundation

enum InfoTableElement {
    case info(String, InfoType)
    case celebrityInfo(Celebrity)
    case biographyInfo(Celebrity)
    case achievementInfo(Celebrity, Achievement)
}

enum InfoType {
    case biography
    case achievement
}
