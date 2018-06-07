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
    // MARK: - Instance vars
    var idNum = UUID.init()
    var hashValue: Int {
        return idNum.hashValue
    }
    var name: String
    var taskCount = 0
    var taskDone = 0
    var color: UIColor
    
    // MARK: - Methods
    // MARK: Constructor
    init(name: String, color: UIColor) {
        self.name = name
        self.color = color
    }
    
    // Mark: Operator functions
    static func == (lhs: Group, rhs: Group) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    // Mark: Private functions
    static func createGroups() -> [Group]
    {
        var groups = [Group]()
        groups.append(Group(name: "Personal", color: UIColor.flatRed()))
        groups.append(Group(name: "Work", color: UIColor.flatBlue()))
        groups.append(Group(name: "Home", color: UIColor.flatGreen()))
        return groups
    }
}
