//
//  DetailTaskViewController.swift
//  ReminderApp
//
//  Created by Reuben Simphiwe Kuse on 2023/08/13.
//

import Foundation
import UIKit

class DetailTaskViewController: UIViewController {
    
    // Task has no value. It is set to nil. You can listen for when the value is changed or nil is changed to a value.
    var task: Task? {
        didSet {
            guard let newTask = task else {
                return
            }
            detailLabel.text = newTask.title  
        }
    }
    
    lazy var detailLabel: UILabel = {
       let label = UILabel()
       label.font = UIFont.systemFont(ofSize: 24, weight: UIFont.Weight.semibold)
       label.textColor = UIColor.black
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    
    lazy var calenderImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icCalendar")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var addReminderLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.semibold)
        label.textColor = UIColor.black
        label.text = "Add Reminder"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var threeDotsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "icDelete"), for: .normal)
        button.addTarget(self, action: #selector(threeDotsButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        let threeDotsBarButtonItem = UIBarButtonItem(customView: threeDotsButton)
        navigationItem.rightBarButtonItem = threeDotsBarButtonItem
    }

    func setupUI() {
        view.addSubview(detailLabel)
        view.addSubview(calenderImageView)
        view.addSubview(addReminderLabel)
        
        detailLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        detailLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        detailLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24).isActive = true
        
        calenderImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        calenderImageView.heightAnchor.constraint(equalToConstant: 19).isActive = true
        calenderImageView.widthAnchor.constraint(equalToConstant: 19).isActive = true
        calenderImageView.topAnchor.constraint(equalTo: detailLabel.bottomAnchor, constant: 22).isActive = true

        addReminderLabel.leftAnchor.constraint(equalTo: calenderImageView.rightAnchor, constant: 16).isActive = true
        addReminderLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        addReminderLabel.topAnchor.constraint(equalTo: calenderImageView.bottomAnchor, constant: -20).isActive = true
            
        
    }
    
    @objc func threeDotsButtonTapped() {
        
        let alertController = UIAlertController(title: nil,
                                                message: nil,
                                                preferredStyle: UIAlertController.Style.actionSheet)
        
        let deleteButton = UIAlertAction(title: "Delete",
                                        style: .destructive, handler: { (_) -> Void in
        })
        
        let cancelButton = UIAlertAction(title: "Cancel",
                                                     style: .cancel,
                                                     handler: { (_) -> Void in
        })
        
        alertController.addAction(deleteButton)
        alertController.addAction(cancelButton)

        present(alertController, animated: true, completion: nil)
        
    }
    
}
