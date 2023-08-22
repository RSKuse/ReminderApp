//
//  NewRemindersViewController.swift
//  ReminderApp
//
//  Created by Reuben Simphiwe Kuse on 2023/08/13.
//

import Foundation
import UIKit

class NewRemindersViewController: UIViewController, UITextFieldDelegate {
    
    // 1. Closure
    var createdTask: ((Task) -> Void)?
    
    // Closure Examples
    var changeNumber: ((Int) -> Void)?
    var didUpdateStatus: ((Bool) -> Void)?
    var colourChanged: ((String) -> Void)?
    var didDelete: (() -> Void)?
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.semibold)
        label.textColor = UIColor.black
        label.text = "Enter Reminder"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var reminderTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Reminder Name"
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.borderStyle = .roundedRect
        textField.returnKeyType = .done
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "New Reminder"
        setupUI()
        addNavigationButtons()
        reminderTextField.becomeFirstResponder() // makes the keyboard appear
    }
    
    func setupUI() {
        view.addSubview(titleLabel)
        view.addSubview(reminderTextField)
        
        
        titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: reminderTextField.topAnchor, constant: -8).isActive = true
        
        reminderTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        reminderTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        reminderTextField.heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
    
    func addNavigationButtons() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Add",
            style: .done,
            target: self,
            action: #selector(addReminder))
        
        // Disables Button from being clickable
        // navigationItem.rightBarButtonItem?.isEnabled = false
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Cancel",
            style: .plain,
            target: self,
            action: #selector(handleDismiss))
    }

    @objc func handleDismiss() {
        dismiss(animated: true)
    }
    
    @objc func addReminder() {
        
        let reminderString = reminderTextField.text
        print(reminderString)
        
        
        let task = Task(title: reminderString!)
        
        // 2: Fire off/Tigger the Closure here.
        createdTask?(task)
        
        
        /*
        if taskFromTextField.isEmpty == true {
            return
        }
        let newTask = Task(title: taskFromTextField)
        createdTask?(newTask)
        */
        dismiss(animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // dismisses the keyboard.
    }
    
}
