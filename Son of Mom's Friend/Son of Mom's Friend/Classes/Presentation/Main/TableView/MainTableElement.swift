//
//  MainTableElement.swift
//  Son of Mom's Friend
//
//  Created by Артем Чжен on 05.12.2023.
//

import Foundation

enum MainTableElement {
    case text(String)
    case author(Author)
}

struct Author {
    let name: String
    let age: Int
}
