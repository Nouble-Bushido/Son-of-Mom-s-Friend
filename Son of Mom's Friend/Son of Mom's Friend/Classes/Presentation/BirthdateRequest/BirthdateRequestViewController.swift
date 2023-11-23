//
//  BirthdateRequestViewController.swift
//  Son of Mom's Friend
//
//  Created by Артем Чжен on 13.11.2023.
//

import UIKit

final class BirthdateRequestViewController: UIViewController, UITextFieldDelegate {
    private lazy var birthDayView = BirthdayView()
    var onContinue: ((Date) -> Void?)?
    
    private let formater: DateFormatter = {
        let formater = DateFormatter()
        formater.dateStyle = .medium
        formater.timeStyle = .none
        return formater
    }()
    
    override func loadView() {
        view = birthDayView
        view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        birthDayView.birthDayTextField.delegate = self
        actionContinueButton()
        setupDatePickerInput()
    }
}

//MARK: DatePicker Setup
private extension BirthdateRequestViewController {
    func setupDatePickerInput() {
        birthDayView.birthDayTextField.inputAccessoryView = birthDayView.toolBar
        birthDayView.datePicker.preferredDatePickerStyle = .wheels
        birthDayView.datePicker.datePickerMode = .date
        birthDayView.birthDayTextField.inputView = birthDayView.datePicker
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(pressDoneButton))
        birthDayView.toolBar.setItems([doneBtn], animated: true)
    }
    
// MARK: - Actions
    @objc func pressDoneButton() {
        birthDayView.birthDayTextField.text = formater.string(from: birthDayView.datePicker.date)
        birthDayView.birthDayTextField.resignFirstResponder()
    }
    
    func actionContinueButton() {
        birthDayView.continueButton.addTarget(self, action: #selector(pressContinueButton), for: .touchUpInside)
    }
    
    @objc func pressContinueButton() {
        guard let selectedDate = formater.date(from: birthDayView.birthDayTextField.text ?? "") else { return }
        
        onContinue?(selectedDate)
        dismiss(animated: true)
    }
}

// MARK: - TextFieldDelegate
extension BirthdateRequestViewController {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
    }
}
