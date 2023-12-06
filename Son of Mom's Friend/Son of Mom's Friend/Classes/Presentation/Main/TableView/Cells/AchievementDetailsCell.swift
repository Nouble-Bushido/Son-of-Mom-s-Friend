//
//  MainTableTextCell.swift
//  Son of Mom's Friend
//
//  Created by Артем Чжен on 05.12.2023.
//

import UIKit

final class AchievementDetailsCell: UITableViewCell {
    lazy var label = makeLabel()
    
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
    func setup(text: String) {
        label.text = text
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
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}

//MARK: Lazy initialization
private extension AchievementDetailsCell {
    func makeLabel() -> UILabel {
        let label = UILabel()
        label.text = "111"
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        return label
    }
}
