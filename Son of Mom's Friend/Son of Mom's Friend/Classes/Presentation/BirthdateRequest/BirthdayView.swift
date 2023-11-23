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
            whiteBackgroundView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -18.scale),
            whiteBackgroundView.widthAnchor.constraint(equalToConstant: 343.scale),
            whiteBackgroundView.heightAnchor.constraint(equalToConstant: 246.scale)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: whiteBackgroundView.leadingAnchor, constant: 20.scale),
            titleLabel.trailingAnchor.constraint(equalTo: whiteBackgroundView.trailingAnchor, constant: -20.scale),
            titleLabel.topAnchor.constraint(equalTo: whiteBackgroundView.topAnchor, constant: 10.scale)
        ])
        
        NSLayoutConstraint.activate([
            birthdayLabel.leadingAnchor.constraint(equalTo: whiteBackgroundView.leadingAnchor, constant: 20.scale),
            birthdayLabel.trailingAnchor.constraint(equalTo: whiteBackgroundView.trailingAnchor, constant: -30.scale),
            birthdayLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20.scale)
        ])
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 25.scale),
            imageView.heightAnchor.constraint(equalToConstant: 25.scale),
            imageView.topAnchor.constraint(equalTo: whiteBackgroundView.topAnchor, constant: 125.scale),
            imageView.trailingAnchor.constraint(equalTo: whiteBackgroundView.trailingAnchor, constant: -30.scale)
        ])
        
        NSLayoutConstraint.activate([
            birthDayTextField.leadingAnchor.constraint(equalTo: whiteBackgroundView.leadingAnchor, constant: 15.scale),
            birthDayTextField.trailingAnchor.constraint(equalTo: whiteBackgroundView.trailingAnchor, constant: -15.scale),
            birthDayTextField.heightAnchor.constraint(equalToConstant: 48.scale),
            birthDayTextField.topAnchor.constraint(equalTo: birthdayLabel.bottomAnchor, constant: 5.scale)
        ])
        
        NSLayoutConstraint.activate([
            continueButton.leadingAnchor.constraint(equalTo: whiteBackgroundView.leadingAnchor, constant: 20.scale),
            continueButton.trailingAnchor.constraint(equalTo: whiteBackgroundView.trailingAnchor, constant: -15.scale),
            continueButton.topAnchor.constraint(equalTo: birthDayTextField.bottomAnchor, constant: 20.scale),
            continueButton.heightAnchor.constraint(equalToConstant: 50.scale)
        ])
    }
}

// MARK: Lazy initialization
private extension BirthdayView {
    func makeWhiteBackgroundView () -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 20.scale
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
    
    func makeTitleLabel() -> UILabel {
        let attrs = TextAttributes()
            .textColor(UIColor.black)
            .font(Fonts.Nunito.regular(size: 14.scale))
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
            .font(Fonts.Nunito.regular(size: 17.scale))
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
        bringSubviewToFront(birthDayTextField)
        addSubview(imageView)
        return imageView
    }
    
    func makeBirthDayTextField() -> UITextField {
        let placeHolderAttrs = TextAttributes()
            .textColor(UIColor.gray)
            .font(Fonts.Nunito.regular(size: 16.scale))
            .lineHeight(24.scale)
            .textAlignment(.left)
            .letterSpacing(-0.41.scale)
        
        let defaultTextAttrs = TextAttributes()
            .textColor(UIColor.black)
            .font(Fonts.Nunito.bold(size: 16.scale))
            .lineHeight(24.scale)
            .textAlignment(.left)
            .letterSpacing(-0.38.scale)
        
        let textField = UITextField()
        textField.attributedPlaceholder = "BirthdateRequest.DateFormat.Text".localized.attributed(with: placeHolderAttrs)
        textField.defaultTextAttributes = defaultTextAttrs.dictionary
        textField.borderStyle = .none
        textField.layer.cornerRadius = 12.scale
        textField.backgroundColor = UIColor.systemGray6
        textField.leftView = UIView(frame: CGRect(x: 0.scale, y: 0.scale, width: 10.scale, height: 30.scale))
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textField)
        return textField
    }
    
    func makeContinueButton() -> UIButton {
        let attrs = TextAttributes()
            .textColor(UIColor.white)
            .font(Fonts.Nunito.medium(size: 17.scale))
            .lineHeight(28.scale)
            .textAlignment(.center)
            .letterSpacing(-0.41.scale)
        
        let button = UIButton()
        button.setAttributedTitle("BirthdateRequest.Continue.Text".localized.attributed(with: attrs), for: .normal )
        button.backgroundColor = UIColor.blue
        button.layer.cornerRadius = 12.scale
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
