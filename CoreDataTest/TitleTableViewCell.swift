//
//  TitleTableViewCell.swift
//  CoreDataTest
//
//  Created by Daniel Hjärtström on 2019-11-22.
//  Copyright © 2019 Daniel Hjärtström. All rights reserved.
//

import UIKit

class TitleTableViewCell: UITableViewCell {
    
    var value: String? {
        return textfield.text
    }

    private lazy var label: UILabel = {
        let temp = UILabel()
        temp.textColor = UIColor.darkGray
        temp.textAlignment = .left
        temp.minimumScaleFactor = 0.7
        temp.adjustsFontSizeToFitWidth = true
        temp.font = UIFont.systemFont(ofSize: 20.0, weight: .medium)
        addSubview(temp)
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10.0).isActive = true
        temp.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10.0).isActive = true
        temp.topAnchor.constraint(equalTo: topAnchor, constant: 10.0).isActive = true
        return temp
    }()
    
    private lazy var textfield: UITextField = {
        let temp = UITextField()
        temp.layer.cornerRadius = 10.0
        temp.autocorrectionType = .no
        temp.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        temp.leftViewMode = .always
        temp.layer.borderColor = UIColor.black.cgColor
        temp.layer.borderWidth = 0.5
        temp.autocapitalizationType = .sentences
        temp.textColor = UIColor.black
        temp.backgroundColor = UIColor.white
        temp.font = UIFont.systemFont(ofSize: 16.0, weight: .light)
        addSubview(temp)
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10.0).isActive = true
        temp.leadingAnchor.constraint(equalTo: label.leadingAnchor).isActive = true
        temp.trailingAnchor.constraint(equalTo: label.trailingAnchor).isActive = true
        temp.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        temp.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10.0).isActive = true
        return temp
    }()
    
    convenience init(title: String?, value: String?) {
        self.init(style: .default, reuseIdentifier: nil)

        label.text = title
        textfield.text = value
    }

}
