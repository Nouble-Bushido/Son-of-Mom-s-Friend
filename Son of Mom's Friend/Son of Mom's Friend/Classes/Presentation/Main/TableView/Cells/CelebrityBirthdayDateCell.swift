//
//  MainTableAuthorCell.swift
//  Son of Mom's Friend
//
//  Created by Артем Чжен on 05.12.2023.
//

import UIKit

final class  CelebrityBirthdayDateCell: UITableViewCell {
    lazy var label = makeLabel()
    
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
    func setup(author: Author) {
        label.text = author.name
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
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}

// MARK: Lazy MakeTableAuthorCell
private extension CelebrityBirthdayDateCell {
    func makeLabel() -> UILabel {
        let label = UILabel()
        label.text = "111"
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        return label
    }
}
