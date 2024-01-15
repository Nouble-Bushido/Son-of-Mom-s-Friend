//
//  CelebrityInfoCell.swift
//  Son of Mom's Friend
//
//  Created by Артем Чжен on 13.01.2024.
//

import UIKit

final class CelebrityInfoCell: UITableViewCell {
    lazy var photo = makePhoto()
    lazy var nameLabel = makeName()
    lazy var picture = makePitcture()
    lazy var birthdayLabel = makeBirthday()
    
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
extension CelebrityInfoCell {
    func setup(celebrity: Celebrity) {
        loadImage(from: celebrity.photoURL)
        nameLabel.text = celebrity.name
        let formattedDate = formattedDate(celebrity.dateOfBirth)
        birthdayLabel.text = formattedDate
    }
}

//MARK: Private
private extension CelebrityInfoCell {
    func initialize() {
        contentView.layer.cornerRadius = 20
        selectionStyle = .none
    }
    
    func loadImage(from urlString: String) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            
            DispatchQueue.main.async { [weak self] in
                self?.photo.image = UIImage(data: data)
            }
        }.resume()
    }
    
    func formattedDate(_ date: Date) -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd.MM.yyyy"
        let stringDate = dateFormater.string(from: date)
        return stringDate
    }
}

//MARK: Make Constraints
private extension CelebrityInfoCell {
    func makeConstraints() {
        NSLayoutConstraint.activate([
            photo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20.scale),
            photo.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            photo.widthAnchor.constraint(equalToConstant: 72.scale),
            photo.heightAnchor.constraint(equalToConstant: 72.scale),
            
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -10.scale),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 97.scale),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.scale),
            
            picture.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5.scale),
            picture.widthAnchor.constraint(equalToConstant: 20.scale),
            picture.heightAnchor.constraint(equalToConstant: 20.scale),
            picture.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 97.scale),
            
            birthdayLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5.scale),
            birthdayLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 120.scale)
        ])
    }
}

//MARK:  Lazy initialization
extension CelebrityInfoCell {
    func makePhoto() -> UIImageView {
        let view = UIImageView()
        view.layer.cornerRadius = 38
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        return view
    }
    
    func makeName() -> UILabel {
        let view = UILabel()
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        return view
    }
    
    func makePitcture() -> UIImageView {
        let view = UIImageView()
        view.image = UIImage(named: "Achievement.Image")
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        return view
    }
    
    func makeBirthday() -> UILabel {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        return view
    }
}
