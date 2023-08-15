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
        
        /*
        let taskFromTextField = reminderTextField.text
        if taskFromTextField != nil && taskFromTextField!.isEmpty == false {
            let newTask = Task(title: taskFromTextField!)
            createdTask?(newTask)
            dismiss(animated: true)
        }
        */
        
        //////////////////////////
        
        // Guard
        /*
        let taskfromTextField = reminderTextField.text // potential to be nil
        if taskfromTextField == nil {
            return // Stop the code from executing beyond here.
        }
        */
        
        
        /////////////////////////
        // Guards are used when there is a chance that some value is nil.
        guard let taskFromTextField = reminderTextField.text else {
            return // Stop the code from executing beyond  Ohere.
        }
        
        // If a value is NIL. Swift allows you to unwrap it with a "!". if the value indeed is NIL, unwrapping it like this will cause your app to crash.
        // "" vs nil
        if taskFromTextField.isEmpty == true {
            return // Stop the code from executing beyond here
        }
        
        var something = "" // empty // 0x6000020b9000
        var somethingElse: String? // nil
        
        let newTask = Task(title: taskFromTextField)
        // 2. Closure
        createdTask?(newTask)
        dismiss(animated: true)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // dismisses the keyboard.
    }
    
}
