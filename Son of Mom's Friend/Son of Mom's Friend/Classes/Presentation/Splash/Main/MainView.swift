//
//  MainView.swift
//  Son of Mom's Friend
//
//  Created by Артем Чжен on 21.11.2023.
//

import UIKit

final class MainView: UIView {
    lazy var viewColor = makeViewColor()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        makeCounstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Private
// MARK: Make constraints
private extension MainView {
    func makeCounstraints() {
        NSLayoutConstraint.activate([
            viewColor.topAnchor.constraint(equalTo: topAnchor),
            viewColor.leadingAnchor.constraint(equalTo: leadingAnchor),
            viewColor.trailingAnchor.constraint(equalTo: trailingAnchor),
            viewColor.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}


// MARK: Lazy initialization
private extension MainView {
    func makeViewColor() -> UIView {
        let view = UIView()
        view.backgroundColor = .yellow
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
}
