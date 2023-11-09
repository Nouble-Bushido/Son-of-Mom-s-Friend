//
//  GradientView.swift
//  Son of Mom's Friend
//
//  Created by Андрей Чернышев on 09.11.2023.
//

import UIKit

class GradientView: UIView {
    override class var layerClass: AnyClass {
        CAGradientLayer.self
    }

    var gradientLayer: CAGradientLayer {
        layer as! CAGradientLayer
    }
}
