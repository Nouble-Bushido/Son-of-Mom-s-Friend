//
//  BirthdateRequestViewController.swift
//  Son of Mom's Friend
//
//  Created by Артем Чжен on 13.11.2023.
//

import UIKit

final class BirthdateRequestViewController: UIViewController, UITextFieldDelegate {
    private lazy var mainView = BirthdayView()
    private let viewModel = SplashViewModel()
    var onContinue: ((Date) -> Void?)?
    
    private let formater: DateFormatter = {
        let formater = DateFormatter()
        formater.dateFormat = "dd.MM.yyyy"
        return formater
    }()
    
    override func loadView() {
        view = mainView
        view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.birthDayTextField.delegate = self
        actionContinueButton()
        setupDatePickerInput()
    }
}

//MARK: DatePicker Setup
private extension BirthdateRequestViewController {
    func setupDatePickerInput() {
        mainView.birthDayTextField.inputAccessoryView = mainView.toolBar
        mainView.datePicker.preferredDatePickerStyle = .wheels
        mainView.datePicker.datePickerMode = .date
        mainView.birthDayTextField.inputView = mainView.datePicker
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(pressDoneButton))
        mainView.toolBar.setItems([doneBtn], animated: true)
    }
    
// MARK: - Actions
    @objc func pressDoneButton() {
        mainView.birthDayTextField.text = formater.string(from: mainView.datePicker.date)
        mainView.birthDayTextField.resignFirstResponder()
    }
    
    func actionContinueButton() {
        mainView.continueButton.addTarget(self, action: #selector(pressContinueButton), for: .touchUpInside)
    }
    
    @objc func pressContinueButton() {
       let date = mainView.datePicker.date
        viewModel.userDidSelectDate(date)
        dismiss(animated: true) { [weak self] in
               self?.onContinue?(date)
        }
    }
}

// MARK: - TextFieldDelegate
extension BirthdateRequestViewController {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
    }
}
