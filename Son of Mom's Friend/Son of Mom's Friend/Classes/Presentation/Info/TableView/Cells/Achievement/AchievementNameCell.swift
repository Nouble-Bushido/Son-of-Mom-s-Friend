//
//  AchievementNameCell.swift
//  Son of Mom's Friend
//
//  Created by Артем Чжен on 13.01.2024.
//

import UIKit

final class AchievementNameCell: UITableViewCell {
    lazy var achievementNameLabel = makeAchievementName()
    
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
extension AchievementNameCell {
    func setup(text: String) {
        achievementNameLabel.text = text
    }
}

//MARK: Private
private extension AchievementNameCell {
    func initialize() {
        contentView.layer.cornerRadius = 20
        selectionStyle = .none
    }
}

//MARK: Make Constraints
private extension AchievementNameCell {
    func makeConstraints() {
        NSLayoutConstraint.activate([
            achievementNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            achievementNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.scale),
            achievementNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.scale),
//            achievementNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

private extension AchievementNameCell {
    func makeAchievementName() -> UILabel {
        let view = UILabel()
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        return view
    }
}
