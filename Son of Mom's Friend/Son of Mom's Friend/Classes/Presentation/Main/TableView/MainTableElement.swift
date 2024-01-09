//
//  MainTableElement.swift
//  Son of Mom's Friend
//
//  Created by Артем Чжен on 05.12.2023.
//

import Foundation

enum MainTableElement {
    case celebrity(Celebrity)
    case celebrityAndAchievementPair(PairCelebrityAndAchievement)
}

struct PairCelebrityAndAchievement {
    let celebrity: Celebrity
    let achievement: Achievement
}
