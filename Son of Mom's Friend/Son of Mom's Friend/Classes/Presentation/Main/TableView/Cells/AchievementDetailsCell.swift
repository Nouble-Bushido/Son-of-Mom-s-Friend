//
//  AchievementDetailsCell.swift
//  Son of Mom's Friend
//
//  Created by Артем Чжен on 05.12.2023.
//

import UIKit

final class AchievementDetailsCell: UITableViewCell {
    lazy var photo = makePhoto()
    lazy var nameLabel = makeNameLabel()
    lazy var dateBirthLabel = makeDateBrithLabel()
    lazy var picture = makePicture()
    lazy var descriptionLabel = makeDescriptionLabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        makeContstraints()
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: Public
extension AchievementDetailsCell {
    func setup(achievemnt: Achievement) {
        nameLabel.text = String(achievemnt.ageAtAchievement)
    }
}

//MARK: Private
private extension AchievementDetailsCell {
    func initialize() {
        backgroundColor = UIColor.clear
        contentView.backgroundColor = UIColor.clear
        
        selectionStyle = .none
    }
}

//MARK: Make Constraints
private extension AchievementDetailsCell {
    func makeContstraints() {
        NSLayoutConstraint.activate([
            photo.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            photo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            photo.heightAnchor.constraint(equalToConstant: 72),
            photo.widthAnchor.constraint(equalToConstant: 72),
            
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: 5),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 5),
            
            picture.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            picture.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: 5),
            
            dateBirthLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            dateBirthLabel.leadingAnchor.constraint(equalTo: picture.trailingAnchor),
            dateBirthLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            descriptionLabel.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: 5),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 5),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 5),
        ])
    }
}

//MARK: Lazy initialization
private extension AchievementDetailsCell {
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

    func makePicture() -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        return imageView
    }
    
    func makeDateBrithLabel() -> UILabel {
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
