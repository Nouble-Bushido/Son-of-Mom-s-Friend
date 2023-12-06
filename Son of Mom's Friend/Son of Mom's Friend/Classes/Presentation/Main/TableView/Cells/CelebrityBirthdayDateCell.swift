//
//  CelebrityBirthdayDateCell.swift
//  Son of Mom's Friend
//
//  Created by Артем Чжен on 05.12.2023.
//

import UIKit

final class  CelebrityBirthdayDateCell: UITableViewCell {
    lazy var photo = makePhoto()
    lazy var nameLabel = makeNameLabel()
    lazy var descriptionLabel = makeDescriptionLabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        makeConstraints()
        initialize()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Public
extension CelebrityBirthdayDateCell {
    func setup(celebrity: Celebrity) {
        descriptionLabel.text = celebrity.name
    }
}

// MARK: Private
private extension CelebrityBirthdayDateCell {
    func initialize() {
        backgroundColor = UIColor.clear
        contentView.backgroundColor = UIColor.clear
        
        selectionStyle = .none
    }
}

// MARK: Make constraints
private extension CelebrityBirthdayDateCell {
    func makeConstraints() {
        NSLayoutConstraint.activate([
            photo.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            photo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            photo.heightAnchor.constraint(equalToConstant: 72),
            photo.widthAnchor.constraint(equalToConstant: 72),
            
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: 5),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 5),
            
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            descriptionLabel.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: 5),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 5),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 5),
        ])
    }
}

// MARK: Lazy MakeTableAuthorCell
private extension CelebrityBirthdayDateCell {
    func makePhoto() -> UIImageView {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 50
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        return imageView
    }
    
    func makeNameLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        return label
    }
    
    func makeDescriptionLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        return label
    }
}
