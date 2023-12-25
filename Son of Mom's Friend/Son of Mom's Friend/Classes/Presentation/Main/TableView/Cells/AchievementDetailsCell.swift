//
//  AchievementDetailsCell.swift
//  Son of Mom's Friend
//
//  Created by Артем Чжен on 05.12.2023.
//

import UIKit

final class AchievementDetailsCell: UITableViewCell {
    lazy var backgroundUIView = makeBackgroundView()
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
    func setup(achievemnt: Achievement, celebrity: Celebrity) {
        let formattedDate = formattedDate(achievemnt.date)
        dateBirthLabel.text = formattedDate
        descriptionLabel.text = achievemnt.description
        nameLabel.text = celebrity.name
        loadImage(from: celebrity.photoURL)
        setupRandomBackgroundColor()
    }
}

//MARK: Private
private extension AchievementDetailsCell {
    func initialize() {
        setupRandomBackgroundColor()
        contentView.layer.cornerRadius = 20
        selectionStyle = .none
    }
    
    func setupRandomBackgroundColor() {
        let randomColor = UIColor(
            red: CGFloat.random(in: 0.8...1),
            green: CGFloat.random(in: 0.8...1),
            blue: CGFloat.random(in: 0.8...1),
            alpha: CGFloat.random(in: 0.8...1))
        backgroundUIView.backgroundColor = randomColor
    }
    
    func formattedDate(_ date: Date) -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd.MM.yyyy"
        let stringDate = dateFormater.string(from: date)
        return stringDate
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

//MARK: Make Constraints
private extension AchievementDetailsCell {
    func makeContstraints() {
        NSLayoutConstraint.activate([
            backgroundUIView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8.scale),
            backgroundUIView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8.scale),
            backgroundUIView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backgroundUIView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            photo.leadingAnchor.constraint(equalTo: backgroundUIView.leadingAnchor, constant: 10.scale),
            photo.centerYAnchor.constraint(equalTo: backgroundUIView.centerYAnchor),
            photo.widthAnchor.constraint(equalToConstant: 72.scale),
            photo.heightAnchor.constraint(equalToConstant: 72.scale),
            
            nameLabel.topAnchor.constraint(equalTo: backgroundUIView.topAnchor, constant: 10.scale),
            nameLabel.leadingAnchor.constraint(equalTo: backgroundUIView.leadingAnchor, constant: 10.scale + 72.scale + 10.scale),
            nameLabel.trailingAnchor.constraint(equalTo: backgroundUIView.trailingAnchor, constant: -10.scale),
            
            picture.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            picture.widthAnchor.constraint(equalToConstant: 20.scale),
            picture.heightAnchor.constraint(equalToConstant: 20.scale),
            picture.leadingAnchor.constraint(equalTo: backgroundUIView.leadingAnchor, constant: 10.scale + 72.scale + 10.scale),
            
            dateBirthLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5.scale),
            dateBirthLabel.leadingAnchor.constraint(equalTo: backgroundUIView.leadingAnchor, constant: 10.scale + 72.scale + 20.scale + 15.scale),
            dateBirthLabel.trailingAnchor.constraint(equalTo: backgroundUIView.trailingAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: dateBirthLabel.bottomAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: backgroundUIView.leadingAnchor, constant: 10.scale + 72.scale + 10.scale),
            descriptionLabel.trailingAnchor.constraint(equalTo: backgroundUIView.trailingAnchor, constant: -10.scale),
            descriptionLabel.bottomAnchor.constraint(equalTo: backgroundUIView.bottomAnchor, constant: -10.scale)
        ])
    }
}

//MARK: Lazy initialization
private extension AchievementDetailsCell {
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
        backgroundUIView.addSubview(imageView)
        return imageView
    }
    
    func makeNameLabel() -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = Fonts.Nunito.semiBold(size: 17.scale)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        backgroundUIView.addSubview(label)
        return label
    }

    func makePicture() -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Achievement.Image")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundUIView.addSubview(imageView)
        return imageView
    }
    
    func makeDateBrithLabel() -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = Fonts.Nunito.regular(size: 14.scale)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        backgroundUIView.addSubview(label)
        return label
    }
    
    func makeDescriptionLabel() -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = Fonts.Nunito.regular(size: 14.scale)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        backgroundUIView.addSubview(label)
        return label
    }
}
