//
//  BiographyNameCell.swift
//  Son of Mom's Friend
//
//  Created by Артем Чжен on 13.01.2024.
//

import UIKit

final class BiographyNameCell: UITableViewCell {
    lazy var biographyLabel = makeBiographyName()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: Public
extension BiographyNameCell {
    func setup(text: String) {
        biographyLabel.text = text
    }
}

//MARK: Private
private extension BiographyNameCell {
    func initialize() {
        contentView.layer.cornerRadius = 20
        selectionStyle = .none
    }
}

//MARK: Make Constraints
private extension BiographyNameCell {
    func makeConstraints() {
        NSLayoutConstraint.activate([
            biographyLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            biographyLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.scale),
            biographyLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.scale)
        ])
    }
}

private extension BiographyNameCell {
    func makeBiographyName() -> UILabel {
        let view = UILabel()
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        return view
    }
}
