//
//  CelebrityBirthdayDateCell.swift
//  Son of Mom's Friend
//
//  Created by Артем Чжен on 05.12.2023.
//

import UIKit

final class  CelebrityBirthdayDateCell: UITableViewCell {
    lazy var backroundUIView = makeBackgroundView()
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
        setupRandomBackgroundColor()
        contentView.layer.cornerRadius = 20.scale
        selectionStyle = .none
    }
    
    func setupRandomBackgroundColor() {
        let randomColor = UIColor(
            red: CGFloat.random(in: 0.8...1),
            green: CGFloat.random(in: 0.8...1),
            blue: CGFloat.random(in: 0.8...1),
            alpha: CGFloat.random(in: 0.8...1))
        backroundUIView.backgroundColor = randomColor
    }
    
    func loadImage(from urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            
            DispatchQueue.main.async { [weak self] in
                self?.photo.image = UIImage(data: data)
            }
        }.resume()
    }
}

// MARK: Make constraints
private extension CelebrityBirthdayDateCell {
    func makeConstraints() {
        
        NSLayoutConstraint.activate([
            backroundUIView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10.scale),
            backroundUIView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            backroundUIView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backroundUIView.heightAnchor.constraint(greaterThanOrEqualToConstant: 80.scale),
            backroundUIView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            photo.leadingAnchor.constraint(equalTo: backroundUIView.leadingAnchor, constant: 10.scale),
            photo.centerYAnchor.constraint(equalTo: backroundUIView.centerYAnchor),
            photo.widthAnchor.constraint(equalToConstant: 72.scale),
            photo.heightAnchor.constraint(equalToConstant: 72.scale),
            
            nameLabel.topAnchor.constraint(equalTo: backroundUIView.topAnchor, constant: 10.scale),
            nameLabel.leadingAnchor.constraint(equalTo: backroundUIView.leadingAnchor, constant: 10.scale + 72.scale + 10.scale),
            nameLabel.trailingAnchor.constraint(equalTo: backroundUIView.trailingAnchor, constant: -10.scale),
            
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5.scale),
            descriptionLabel.leadingAnchor.constraint(equalTo: backroundUIView.leadingAnchor, constant: 10.scale + 72.scale + 10.scale),
            descriptionLabel.trailingAnchor.constraint(equalTo: backroundUIView.trailingAnchor, constant: -10.scale),
            descriptionLabel.bottomAnchor.constraint(equalTo: backroundUIView.bottomAnchor, constant: -10.scale)
        ])
    }
}

// MARK: Lazy MakeTableAuthorCell
private extension CelebrityBirthdayDateCell {
    func makeBackgroundView() -> UIView {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        return view
    }
    
    func makePhoto() -> UIImageView {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 35.scale
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        backroundUIView.addSubview(imageView)
        return imageView
    }
    
    func makeNameLabel() -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = Fonts.Nunito.semiBold(size: 17.scale)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        backroundUIView.addSubview(label)
        return label
    }
    
    func makeDescriptionLabel() -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = Fonts.Nunito.regular(size: 14.scale)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        backroundUIView.addSubview(label)
        return label
    }
}
