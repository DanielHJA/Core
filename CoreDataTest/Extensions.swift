//
//  Extensions.swift
//  CoreDataTest
//
//  Created by Daniel Hjärtström on 2019-11-22.
//  Copyright © 2019 Daniel Hjärtström. All rights reserved.
//

import UIKit
import CoreData

extension NSManagedObject {
   static var identifier: String {
        return String(describing: self)
    }
}
