//
//  InfoView.swift
//  Son of Mom's Friend
//
//  Created by Артем Чжен on 27.12.2023.
//

import UIKit

final class InfoView: UIView {
    lazy var contentView = makeContentView()
    lazy var nameLabel = makeNameLabel()
    lazy var pictureImage = makePicture()
    lazy var birthdayLabel = makeBirthdayLabel()
    lazy var photoImage = makePhoto()
    lazy var bioghraphyLabel = makeBiographyLabel()
    lazy var infoBiographyLabel = makeIntoBiographyLabel()
    lazy var achievemetnLabel = makeAchievementLabel()
    lazy var tableView = makeTableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Make constraints
private extension InfoView {
    func makeConstraints() {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            photoImage.topAnchor.constraint(equalTo: topAnchor, constant: 100.scale),
            photoImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10.scale),
            photoImage.heightAnchor.constraint(equalToConstant: 100.scale),
            photoImage.widthAnchor.constraint(equalToConstant: 100.scale),
            
            nameLabel.centerYAnchor.constraint(equalTo: photoImage.centerYAnchor, constant: -10.scale),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 120.scale),
            
            pictureImage.widthAnchor.constraint(equalToConstant: 20.scale),
            pictureImage.heightAnchor.constraint(equalToConstant: 20.scale),
            pictureImage.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5.scale),
            pictureImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 120.scale),
            
            birthdayLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5.scale),
            birthdayLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 142.scale),
            
            bioghraphyLabel.topAnchor.constraint(equalTo: photoImage.bottomAnchor, constant: 20.scale),
            bioghraphyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10.scale),
            
            infoBiographyLabel.topAnchor.constraint(equalTo: bioghraphyLabel.bottomAnchor, constant: 5.scale),
            infoBiographyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10.scale),
            infoBiographyLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10.scale),
            
            achievemetnLabel.topAnchor.constraint(equalTo: infoBiographyLabel.bottomAnchor, constant: 20.scale),
            achievemetnLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10.scale),
            achievemetnLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10.scale),
            
            tableView.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10.scale),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}

// MARK: Lazy initialization
private extension InfoView {
    func makeContentView() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
    
    func makeNameLabel() -> UILabel {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        return view
    }
    
    func makePicture() -> UIImageView {
        let view = UIImageView()
        view.image = UIImage(named: "Achievement.Image")
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        return view
    }
    
    func makeBirthdayLabel() -> UILabel {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        return view
    }
    
    func makePhoto() -> UIImageView {
        let view = UIImageView()
        view.layer.cornerRadius = 50.scale
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        return view
    }
    
    func makeBiographyLabel() -> UILabel {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        return view
    }
    
    func  makeIntoBiographyLabel() -> UILabel {
        let view = UILabel()
        view.numberOfLines = 0
        view.layer.backgroundColor = UIColor(red: 0.945, green: 0.953, blue: 0.99, alpha: 1).cgColor
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        return view
    }
    
    func makeAchievementLabel() -> UILabel {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        return view
    }
    
    func makeTableView() -> InfoTableView {
        let view = InfoTableView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
}
