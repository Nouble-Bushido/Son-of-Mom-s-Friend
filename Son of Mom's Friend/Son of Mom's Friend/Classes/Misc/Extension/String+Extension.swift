//
//  String+Extension.swift
//  Son of Mom's Friend
//
//  Created by Андрей Чернышев on 09.11.2023.
//

import Foundation

extension String {
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
}
