//
//  BirthdateRequestViewController.swift
//  Son of Mom's Friend
//
//  Created by Артем Чжен on 13.11.2023.
//

import UIKit

final class BirthdateRequestViewController: UIViewController, UITextFieldDelegate {
    private lazy var birthDayView = BirthdayView()
    private lazy var viewModel = BirthdayModel()
    
    private let formater: DateFormatter = {
        let formater = DateFormatter()
        formater.dateStyle = .medium
        formater.timeStyle = .none
        return formater
    }()
    
    override func loadView() {
        view = birthDayView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        birthDayView.birthDayTextField.delegate = self
        actionContinueButton()
        setupDatePickerInput()
    }
}

//MARK: TextFieldDelegate
extension BirthdateRequestViewController {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == birthDayView.birthDayTextField {
            
        }
    }
}

//MARK: DatePicker Setup
private extension BirthdateRequestViewController {
    func setupDatePickerInput() {
        birthDayView.birthDayTextField.inputAccessoryView = birthDayView.toolBar
        birthDayView.datePicker.preferredDatePickerStyle = .wheels
        birthDayView.datePicker.datePickerMode = .date
        birthDayView.birthDayTextField.inputView = birthDayView.datePicker
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(pressDoneBtn))
        birthDayView.toolBar.setItems([doneBtn], animated: true)
    }
    
// MARK: - Actions
    @objc func pressDoneBtn() {
        birthDayView.birthDayTextField.text = formater.string(from: birthDayView.datePicker.date)
        birthDayView.birthDayTextField.resignFirstResponder()
    }
    
    func actionContinueButton() {
        birthDayView.continueButton.addTarget(self, action: #selector(pressContinue), for: .touchUpInside)
    }
    
    @objc func pressContinue() {
        let vc = MainViewCountroller()
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
}
