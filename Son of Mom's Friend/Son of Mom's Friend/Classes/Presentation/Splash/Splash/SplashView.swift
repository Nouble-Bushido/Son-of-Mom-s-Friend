//
//  SplashView.swift
//  Son of Mom's Friend
//
//  Created by Андрей Чернышев on 09.11.2023.
//

import UIKit

final class SplashView: GradientView {
    lazy var imageView = makeImageView()
    lazy var textLabel = makeTextLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        makeConstraints()
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Private
private extension SplashView {
    func initialize() {
        gradientLayer.colors = [
            UIColor(integralRed: 28, green: 55, blue: 209).cgColor,
            UIColor(integralRed: 91, green: 110, blue: 222).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
    }
}

// MARK: Make constraints
private extension SplashView {
    func makeConstraints() {
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 359.scale),
            imageView.heightAnchor.constraint(equalToConstant: 478.scale),
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 67.scale),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -67.scale),
            textLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 36.scale)
        ])
    }
}

// MARK: Lazy initialization
private extension SplashView {
    func makeImageView() -> UIImageView {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "Splash.Image")
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
    
    func makeTextLabel() -> UILabel {
        let attrs = TextAttributes()
            .textColor(UIColor.white)
            .font(Fonts.Nunito.semiBold(size: 24.scale))
            .lineHeight(28.scale)
            .textAlignment(.center)
            .letterSpacing(-0.41.scale)
        
        let view = UILabel()
        view.attributedText = "Splash.Text".localized.attributed(with: attrs)
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
}
