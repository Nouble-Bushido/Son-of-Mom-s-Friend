//
//  InfoElement.swift
//  Son of Mom's Friend
//
//  Created by Артем Чжен on 04.01.2024.
//

import Foundation

enum InfoTablePair {
    case pair(InfoElements)
}

struct InfoElements {
    let celebrity: Celebrity
    let achievements: Achievement
}
