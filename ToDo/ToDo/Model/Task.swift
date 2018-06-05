//
//  Task.swift
//  ToDo
//
//  Created by Minura Iddamalgoda on 5/6/18.
//  Copyright © 2018 Minura Iddamalgoda. All rights reserved.
//

import Foundation

class Task
{
    var idNum = UUID.init()
    var name: String
    var group: Group
    var date: Date
    var isDone: Bool = false
    
    init(name: String, group: Group, date: Date) {
        self.group = group
        self.date = date
        self.name = name
    }
}
