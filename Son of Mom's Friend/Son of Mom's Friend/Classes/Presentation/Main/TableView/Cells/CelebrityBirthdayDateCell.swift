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
        initialize()
        makeConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Public
extension CelebrityBirthdayDateCell {
    func setup(celebrity: Celebrity) {
        nameLabel.text = celebrity.name
        loadImage(from: celebrity.photoURL)
        descriptionLabel.text = celebrity.mainAchievement
    }
}

// MARK: Private
private extension CelebrityBirthdayDateCell {
    func initialize() {
        backgroundColor = UIColor.clear
        contentView.backgroundColor = UIColor.clear
        
        selectionStyle = .none
    }
    
    private func loadImage(from urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self.photo.image = UIImage(data: data)
            }
        }.resume()
    }
}

// MARK: Make constraints
private extension CelebrityBirthdayDateCell {
    func makeConstraints() {
        NSLayoutConstraint.activate([
            photo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10.scale),
            photo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.scale),
            photo.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -10.scale),
            photo.widthAnchor.constraint(equalToConstant: 72.scale),
            photo.heightAnchor.constraint(equalToConstant: 72.scale),
            
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20.scale),
            nameLabel.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: 10.scale),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.scale),
            
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8.scale),
            descriptionLabel.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: 10.scale),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.scale),
            descriptionLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -10.scale)
        ])
    }
}

// MARK: Lazy MakeTableAuthorCell
private extension CelebrityBirthdayDateCell {
    func makePhoto() -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 30.scale
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageView)
        return imageView
    }
    
    func makeNameLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(label)
        return label
    }
    
    func makeDescriptionLabel() -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(label)
        return label
    }
}
