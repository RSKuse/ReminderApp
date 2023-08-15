//
//  TableViewCell.swift
//  ReminderApp
//
//  Created by Reuben Simphiwe Kuse on 2023/08/02.
//

import Foundation
import UIKit

class TaskTableViewCell: UITableViewCell {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.semibold)
        label.textColor = UIColor.black
        label.text = "Pickup Ndalo"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var markTaskImageButton: UIButton = {
        let button = UIButton()
        let icon = UIImage(named: "rectangle")
        button.setImage(icon, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: reuseIdentifier)
        accessoryType = .none
        setupUI()
        
        func setupUI() {
            addSubview(titleLabel)
            addSubview(markTaskImageButton)
            
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 11).isActive = true
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -11).isActive = true
            
            markTaskImageButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
            markTaskImageButton.topAnchor.constraint(equalTo: topAnchor, constant: 11).isActive = true
            markTaskImageButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -11).isActive = true
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
