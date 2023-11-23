//
//  BirthdayView.swift
//  Son of Mom's Friend
//
//  Created by Артем Чжен on 16.11.2023.
//

import UIKit

final class BirthdayView: UIView {
    lazy var whiteBackgroundView = makeWhiteBackgroundView()
    lazy var titleLabel = makeTitleLabel()
    lazy var birthdayLabel = makeBirthdayLabel()
    lazy var imageView = makeImageView()
    lazy var birthDayTextField = makeBirthDayTextField()
    lazy var continueButton = makeContinueButton()
    lazy var toolBar = makeToolBar()
    lazy var datePicker = makeDatePicker()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        makeСonstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Make constraints
private extension BirthdayView {
    func makeСonstraints() {
        NSLayoutConstraint.activate([
            whiteBackgroundView.centerXAnchor.constraint(equalTo: centerXAnchor),
            whiteBackgroundView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -18),
            whiteBackgroundView.widthAnchor.constraint(equalToConstant: 343.scale),
            whiteBackgroundView.heightAnchor.constraint(equalToConstant: 246.scale)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: whiteBackgroundView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: whiteBackgroundView.trailingAnchor, constant: -30),
            titleLabel.topAnchor.constraint(equalTo: whiteBackgroundView.topAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: whiteBackgroundView.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            birthdayLabel.leadingAnchor.constraint(equalTo: whiteBackgroundView.leadingAnchor, constant: 20),
            birthdayLabel.trailingAnchor.constraint(equalTo: whiteBackgroundView.trailingAnchor, constant: -30),
            birthdayLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            birthdayLabel.centerXAnchor.constraint(equalTo: whiteBackgroundView.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 25),
            imageView.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            birthDayTextField.leadingAnchor.constraint(equalTo: whiteBackgroundView.leadingAnchor, constant: 20),
            birthDayTextField.trailingAnchor.constraint(equalTo: whiteBackgroundView.trailingAnchor, constant: -15),
            birthDayTextField.heightAnchor.constraint(equalToConstant: 48.scale),
            birthDayTextField.topAnchor.constraint(equalTo: birthdayLabel.bottomAnchor, constant: 5)
        ])
        
        NSLayoutConstraint.activate([
            continueButton.leadingAnchor.constraint(equalTo: whiteBackgroundView.leadingAnchor, constant: 20),
            continueButton.trailingAnchor.constraint(equalTo: whiteBackgroundView.trailingAnchor, constant: -15),
            continueButton.bottomAnchor.constraint(equalTo: whiteBackgroundView.bottomAnchor, constant: -20),
            continueButton.topAnchor.constraint(equalTo: birthDayTextField.bottomAnchor, constant: 20)
        ])
    }
}

// MARK: Lazy initialization
private extension BirthdayView {
    func makeWhiteBackgroundView () -> UIView {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
    
    func makeTitleLabel() -> UILabel {
        let attrs = TextAttributes()
            .textColor(UIColor.black)
            .font(Fonts.Nunito.regular(size: 14))
            .lineHeight(18.scale)
            .textAlignment(.left)
            .letterSpacing(-0.39.scale)
        
        let label = UILabel()
        label.attributedText = "BirthdateRequest.Title.Text".localized.attributed(with: attrs)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        return label
    }
    
    func makeBirthdayLabel() -> UILabel {
        let attrs = TextAttributes()
            .textColor(UIColor.black)
            .font(Fonts.Nunito.regular(size: 17))
            .lineHeight(28.scale)
            .textAlignment(.left)
            .letterSpacing(-0.41.scale)
        
        let label = UILabel()
        label.attributedText = "BirthdateRequest.Birthday.Text".localized.attributed(with: attrs)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        return label
    }
    
    func makeImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "Calendar.Image")
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        return imageView
    }
    
    func makeBirthDayTextField() -> UITextField {
        let attrs = TextAttributes()
            .textColor(UIColor.gray)
            .font(Fonts.Nunito.regular(size: 17))
            .lineHeight(24.scale)
            .textAlignment(.left)
            .letterSpacing(-0.41.scale)
        
        let textField = UITextField()
        textField.attributedPlaceholder = "BirthdateRequest.DateFormat.Text".localized.attributed(with: attrs)
        textField.defaultTextAttributes = attrs.dictionary
        textField.borderStyle = .none
        textField.layer.cornerRadius = 12
        textField.backgroundColor = .systemGray6
        textField.rightView = imageView
        textField.rightViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textField)
        return textField
    }
    
    func makeContinueButton() -> UIButton {
        let attrs = TextAttributes()
            .textColor(UIColor.white)
            .font(Fonts.Nunito.medium(size: 17))
            .lineHeight(28.scale)
            .textAlignment(.center)
            .letterSpacing(-0.41.scale)
        
        let button = UIButton()
        button.setAttributedTitle("BirthdateRequest.Continue.Text".localized.attributed(with: attrs), for: .normal )
        button.backgroundColor = UIColor.blue
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        addSubview(button)
        return button
    }
    
    func makeToolBar() -> UIToolbar {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        return toolBar
    }
    
    func makeDatePicker() -> UIDatePicker {
        let datePicker = UIDatePicker()
        return datePicker
    }
}
