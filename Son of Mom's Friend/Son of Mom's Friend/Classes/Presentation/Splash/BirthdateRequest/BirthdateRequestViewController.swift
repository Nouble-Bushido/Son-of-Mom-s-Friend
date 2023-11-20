//
//  BirthdateRequestViewController.swift
//  Son of Mom's Friend
//
//  Created by Артем Чжен on 13.11.2023.
//

import UIKit

final class BirthdateRequestViewController: UIViewController, UITextFieldDelegate {
    lazy var birthDayView = BirthdayView()
    
    private lazy var viewModel = BirthdayModel()
    
    override func loadView() {
        view = birthDayView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        birthDayView.birthDayTextField.delegate = self
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
extension BirthdateRequestViewController {
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
        let formater = DateFormatter()
             formater.dateStyle = .medium
             formater.timeStyle = .none
     
        birthDayView.birthDayTextField.text = formater.string(from: birthDayView.datePicker.date)
        birthDayView.birthDayTextField.resignFirstResponder()
    }
}
