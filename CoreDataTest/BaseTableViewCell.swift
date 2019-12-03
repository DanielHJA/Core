//
//  BaseTableViewCell.swift
//  CoreDataTest
//
//  Created by Daniel Hjärtström on 2019-11-22.
//  Copyright © 2019 Daniel Hjärtström. All rights reserved.
//

import UIKit
import CoreData

class BaseTableViewCell<T: NSManagedObject>: UITableViewCell {

    func configure(_ object: T) {}
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        accessoryType = .disclosureIndicator
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
