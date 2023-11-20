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
        
        makeconstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Private
// MARK: Make constraints
private extension BirthdayView {
    func makeconstraints() {
        NSLayoutConstraint.activate([
            whiteBackgroundView.centerXAnchor.constraint(equalTo: centerXAnchor),
            whiteBackgroundView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -18),
            whiteBackgroundView.widthAnchor.constraint(equalToConstant: 343.scale),
            whiteBackgroundView.heightAnchor.constraint(equalToConstant: 246.scale)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.widthAnchor.constraint(equalToConstant: 302.scale),
            titleLabel.heightAnchor.constraint(equalToConstant: 56.scale),
            titleLabel.topAnchor.constraint(equalTo: whiteBackgroundView.topAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: whiteBackgroundView.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            birthdayLabel.widthAnchor.constraint(equalToConstant: 302.scale),
            birthdayLabel.heightAnchor.constraint(equalToConstant: 22.scale),
            birthdayLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            birthdayLabel.centerXAnchor.constraint(equalTo: whiteBackgroundView.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            birthDayTextField.widthAnchor.constraint(equalToConstant: 311.scale),
            birthDayTextField.heightAnchor.constraint(equalToConstant: 48.scale),
            birthDayTextField.topAnchor.constraint(equalTo: birthdayLabel.bottomAnchor, constant: 5),
            birthDayTextField.centerXAnchor.constraint(equalTo: whiteBackgroundView.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            continueButton.widthAnchor.constraint(equalToConstant: 311.scale),
            continueButton.heightAnchor.constraint(equalToConstant: 48.scale),
            continueButton.topAnchor.constraint(equalTo: birthDayTextField.bottomAnchor, constant: 30),
            continueButton.centerXAnchor.constraint(equalTo: whiteBackgroundView.centerXAnchor)
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
            .font(Fonts.Nunito.semiBold(size: 14))
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
            .font(Fonts.Nunito.semiBold(size: 17))
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
        let imageView = UIImageView(image: UIImage(named: "Calendar.Image"))
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        return imageView
    }
    
    func makeBirthDayTextField() -> UITextField {
        let textField = UITextField()
        textField.placeholder = "DD.MM.YY"
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 12
        textField.rightView = imageView
        textField.rightViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textField)
        return textField
    }
    
    func makeContinueButton() -> UIButton {
        let button = UIButton()
        button.setTitle("BirthdateRequest.Continue.Text".localized, for: .normal)
        button.backgroundColor = UIColor.blue
        button.layer.cornerRadius = 12
//        button.addTarget(self, action: #selector(pressButton), for: .touchUpInside)
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
