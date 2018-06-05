//
//  Group.swift
//  ToDo
//
//  Created by Minura Iddamalgoda on 5/6/18.
//  Copyright © 2018 Minura Iddamalgoda. All rights reserved.
//

import Foundation
import UIKit

class Group : Hashable
{
    // MARK: Instance vars
    var idNum = UUID.init()
    var hashValue: Int {
        return idNum.hashValue
    }
    var name: String
    var taskCount = 0
    var color: UIColor
    
    init(name: String, color: UIColor) {
        self.name = name
        self.color = color
    }
    
    static func == (lhs: Group, rhs: Group) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}
