//
//  AchievemtInfoCell.swift
//  Son of Mom's Friend
//
//  Created by Артем Чжен on 13.01.2024.
//
//
import UIKit

final class AchievemtInfoCell: UITableViewCell {
    lazy var backgroundUIView = makeBackgroundView()
    lazy var photo = makePhoto()
    lazy var achievementLabel = makeAchievement()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        makeConstraints()
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: Public
extension AchievemtInfoCell {
    func setup(celebrity: Celebrity, achievement: Achievement) {
        loadImage(from: celebrity.photoURL)
        achievementLabel.text = achievement.description
        setupRandomBackgroundColor()
    }
}

//MARK: Private
private extension AchievemtInfoCell {
    func initialize() {
        contentView.layer.cornerRadius = 20.scale
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
    
    func loadImage(from urlString: String) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            
            DispatchQueue.main.async { [weak self] in
                self?.photo.image = UIImage(data: data)
            }
        }.resume()
    }
}

//MARK: Make Constraints
private extension AchievemtInfoCell {
    func makeConstraints() {
        NSLayoutConstraint.activate([
            backgroundUIView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15.scale),
            backgroundUIView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            backgroundUIView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.scale),
            backgroundUIView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.scale),
            
            photo.leadingAnchor.constraint(equalTo: backgroundUIView.leadingAnchor, constant: 10.scale),
            photo.centerYAnchor.constraint(equalTo: backgroundUIView.centerYAnchor),
            photo.widthAnchor.constraint(equalToConstant: 72.scale),
            photo.heightAnchor.constraint(equalToConstant: 72.scale),
            
            achievementLabel.topAnchor.constraint(equalTo: backgroundUIView.topAnchor),
            achievementLabel.leadingAnchor.constraint(equalTo: backgroundUIView.leadingAnchor, constant: 97.scale),
            achievementLabel.trailingAnchor.constraint(equalTo: backgroundUIView.trailingAnchor, constant: -10.scale),
            achievementLabel.bottomAnchor.constraint(equalTo: backgroundUIView.bottomAnchor)
        ])
    }
}

//MARK:  Lazy initialization
extension AchievemtInfoCell {
    func makeBackgroundView() -> UIView {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        return view
    }
    
    func makePhoto() -> UIImageView {
        let view = UIImageView()
        view.layer.cornerRadius = 38
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        backgroundUIView.addSubview(view)
        return view
    }
    
    func makeAchievement() -> UILabel {
        let view = UILabel()
        view.numberOfLines = 0
        view.font = Fonts.Nunito.regular(size: 14.scale)
        view.translatesAutoresizingMaskIntoConstraints = false
        backgroundUIView.addSubview(view)
        return view
    }
}
