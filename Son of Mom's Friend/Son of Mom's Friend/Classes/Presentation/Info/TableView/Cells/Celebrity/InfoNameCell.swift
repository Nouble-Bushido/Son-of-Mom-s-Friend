//
//  InfoNameCell.swift
//  Son of Mom's Friend
//
//  Created by Артем Чжен on 17.01.2024.
//

import UIKit

final class InfoNameCell: UITableViewCell {
    lazy var nameLabel = makeName()
    
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
extension InfoNameCell {
    func setup(text: String) {
        nameLabel.text = text
    }
}

//MARK: Private
private extension InfoNameCell {
    func initialize() {
        selectionStyle = .none
    }
}

//MARK: Make Constraints
private extension InfoNameCell {
    func makeConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20.scale),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.scale),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.scale),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

private extension InfoNameCell {
    func makeName() -> UILabel {
        let view = UILabel()
        view.numberOfLines = 0
        view.font = Fonts.Nunito.semiBold(size: 18)
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        return view
    }
}
