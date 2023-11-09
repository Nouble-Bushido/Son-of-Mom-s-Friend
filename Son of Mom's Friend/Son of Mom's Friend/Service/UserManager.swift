//
//  UserManager.swift
//  Son of Mom's Friend
//
//  Created by Артем Чжен on 01.11.2023.
//

import UIKit

class UserManager {
    
   static func getUserBirthday() -> Date? {
        return UserDefaults.standard.value(forKey: "userBirthday") as? Date
    }
    
    func saveUserBirthday(birthday: Date) {
        UserDefaults.standard.set(birthday, forKey: "userBirthday")
    }
}
