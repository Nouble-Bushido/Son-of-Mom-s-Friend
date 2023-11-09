//
//  Fonts.swift
//  Son of Mom's Friend
//
//  Created by Андрей Чернышев on 09.11.2023.
//

import UIKit

enum Fonts {
    enum Nunito {
        static func medium(size: CGFloat) -> UIFont {
            UIFont(name: "Nunito-Medium", size: size)!
        }
        
        static func semiBold(size: CGFloat) -> UIFont {
            UIFont(name: "Nunito-SemiBold", size: size)!
        }
        
        static func regular(size: CGFloat) -> UIFont {
            UIFont(name: "Nunito-Regular", size: size)!
        }
        
        static func bold(size: CGFloat) -> UIFont {
            UIFont(name: "Nunito-Bold", size: size)!
        }
    }
}
