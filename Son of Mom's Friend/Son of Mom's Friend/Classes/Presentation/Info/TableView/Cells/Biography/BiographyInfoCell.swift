//
//  BiographyInfoCell.swift
//  Son of Mom's Friend
//
//  Created by Артем Чжен on 13.01.2024.
//

import UIKit

final class BiographyInfoCell: UITableViewCell {
    lazy var biographyInfoLabel = makeBiography()
    
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
extension BiographyInfoCell {
    func setup(celebrity: Celebrity) {
        biographyInfoLabel.text = celebrity.biography
    }
}

//MARK: Private
private extension BiographyInfoCell {
    func initialize() {
        contentView.layer.cornerRadius = 20
        selectionStyle = .none
    }
}

//MARK: Make Constraints
private extension BiographyInfoCell {
    func makeConstraints() {
        NSLayoutConstraint.activate([
            biographyInfoLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            biographyInfoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.scale),
            biographyInfoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.scale),
            biographyInfoLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

private extension BiographyInfoCell {
    func makeBiography() -> UILabel {
        let view = UILabel()
        view.layer.cornerRadius = 20
        view.numberOfLines = 0
        view.layer.backgroundColor = UIColor(red: 0.945, green: 0.953, blue: 0.99, alpha: 1).cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        return view
    }
}
