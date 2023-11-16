//
//  BirthdateRequestViewController.swift
//  Son of Mom's Friend
//
//  Created by Артем Чжен on 13.11.2023.
//

import UIKit

class BirthdateRequestViewController: UIViewController {
    let datePicker = UIDatePicker()
    let userManager = UserManager()
    
    var imageView: UIImageView = {
        var view = UIImageView()
        
        let  image = UIImage(named: "Calendar.Image") ?? UIImage()
        let maxWidth: CGFloat = 30
        
        view = UIImageView(image: image)
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.widthAnchor.constraint(lessThanOrEqualToConstant: maxWidth).isActive = true
        return view
    }()
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yy"
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        createDatePicker()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showAC()
    }
    
    func showAC() {
        let ac = UIAlertController(title: "BirthdateRequest.Title.Text".localized, message: nil, preferredStyle: .alert)
        ac.view.translatesAutoresizingMaskIntoConstraints = false
        ac.addTextField { textField in
            textField.placeholder = "DD.MM.YY"
            textField.borderStyle = .roundedRect
            textField.rightView =  self.imageView
            textField.rightViewMode = .always
            textField.inputView = self.datePicker
            textField.inputAccessoryView = self.createToolBar()
        }
        
        let okAction = UIAlertAction(title: "BirthdateRequest.Continue.Text".localized, style: .default) { [weak self] _ in
            guard let selectedDate = self?.datePicker.date else { return }
            let user = User(dateOfBirth: selectedDate)
            self?.userManager.set(user: user)
        }
        
        ac.addAction(okAction)
        present(ac, animated: true)
    }
    
    func createToolBar() -> UIToolbar {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(donePressed))
        toolBar.setItems([doneButton], animated: true)
        
        return toolBar
    }
    
    func createDatePicker() {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
    }
    
    @objc func donePressed() {
        view.endEditing(true)
        guard let ac = presentedViewController as? UIAlertController,
              let textField = ac.textFields?.first else { return }
        textField.text = dateFormatter.string(from: datePicker.date)
        textField.resignFirstResponder()
    }
}
