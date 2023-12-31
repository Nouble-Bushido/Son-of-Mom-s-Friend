//
//  MainView.swift
//  Son of Mom's Friend
//
//  Created by Артем Чжен on 21.11.2023.
//

import UIKit

final class MainView: UIView {
    lazy var viewColor = makeViewColor()
    lazy var viewImage = makeImageView()
    lazy var todayLabel = makeLabelToday()
    lazy var dateLabel = makeLabelDate()
    lazy var settingButton = makeButton()
    lazy var tableView = makeTableView()
    lazy var currentDate = Date()
    lazy var dateFormater = DateFormatter()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        makeCounstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Make constraints
private extension MainView {
    func makeCounstraints() {
        NSLayoutConstraint.activate([
            viewColor.topAnchor.constraint(equalTo: topAnchor),
            viewColor.leadingAnchor.constraint(equalTo: leadingAnchor),
            viewColor.trailingAnchor.constraint(equalTo: trailingAnchor),
            viewColor.heightAnchor.constraint(equalToConstant: 280.scale),
            
            viewImage.topAnchor.constraint(equalTo: viewColor.topAnchor, constant: 20.scale),
            viewImage.centerXAnchor.constraint(equalTo: viewColor.centerXAnchor),
            viewImage.heightAnchor.constraint(equalToConstant: 260.scale),
            
            todayLabel.topAnchor.constraint(equalTo: viewColor.topAnchor, constant: 220.scale),
            todayLabel.leadingAnchor.constraint(equalTo: viewColor.leadingAnchor, constant: 10.scale),
            
            dateLabel.topAnchor.constraint(equalTo: todayLabel.bottomAnchor, constant: 5.scale),
            dateLabel.leadingAnchor.constraint(equalTo: viewColor.leadingAnchor, constant: 10.scale),
            
            settingButton.topAnchor.constraint(equalTo: viewColor.topAnchor, constant: 70.scale),
            settingButton.trailingAnchor.constraint(equalTo: viewColor.trailingAnchor, constant: -20.scale),
            
            tableView.topAnchor.constraint(equalTo: viewColor.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

// MARK: Lazy initialization
private extension MainView {
    func makeViewColor() -> GradientView {
        let view = GradientView()
        view.gradientLayer.colors = [
            UIColor(integralRed: 28, green: 55, blue: 209).cgColor,
            UIColor(integralRed: 91, green: 110, blue: 222).cgColor
        ]
        view.gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        view.gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
    
    func makeImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Main.Image")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        viewColor.addSubview(imageView)
        return imageView
    }
    
    func makeLabelToday() -> UILabel {
        let attrs = TextAttributes()
            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
            .font(Fonts.Nunito.bold(size: 20.scale))
            .lineHeight(22.scale)
            .textAlignment(.center)
            .letterSpacing(0.41.scale)
        
        let label = UILabel()
        label.attributedText = "Main.Today.Text".localized.attributed(with: attrs)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        viewColor.addSubview(label)
        return label
    }
    
    func makeLabelDate() -> UILabel {
        dateFormater.dateFormat = "dd_mm_yyyy"
        dateFormater.dateStyle = .long
        dateFormater.locale = Locale(identifier: "ru_RU")
        let formattedDate = dateFormater.string(from: currentDate)
        
        let attrs = TextAttributes()
            .textColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
            .font(Fonts.Nunito.semiBold(size: 18.scale))
            .lineHeight(22.scale)
            .textAlignment(.center)
            .letterSpacing(0.41.scale)
        
        let label = UILabel()
        label.attributedText = formattedDate.attributed(with: attrs)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        viewColor.addSubview(label)
        return label
    }
    
    func makeButton() -> UIButton {
        let button = UIButton()
        button.setImage(UIImage(named: "Main.Setting"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        viewColor.addSubview(button)
        return button
    }
    
    func makeTableView() -> MainTableView {
        let tableView = MainTableView()
        tableView.backgroundColor = UIColor.clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(tableView)
        return tableView
    }
}
