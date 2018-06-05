//
//  ViewController.swift
//  ToDo
//
//  Created by Minura Iddamalgoda on 5/6/18.
//  Copyright © 2018 Minura Iddamalgoda. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    // MARK: IBOutlets
    @IBOutlet weak var bgView: UIView!
    
    // MARK: IBActions
    @IBAction func redPressed(_ sender: UIButton)
    {
        UIView.animate(withDuration: 0.5) {
            self.bgView.backgroundColor = UIColor.flatRed()
        }
    }
    
    @IBAction func greenPressed(_ sender: UIButton)
    {
        UIView.animate(withDuration: 0.5) {
            self.bgView.backgroundColor = UIColor.flatGreen()
        }    }

    @IBAction func bluePressed(_ sender: UIButton)
    {
        UIView.animate(withDuration: 0.5) {
            self.bgView.backgroundColor = UIColor.flatBlue()
        }
    }
    
    // MARK: Instance vars
    var groupSet = Set<Group>()
    
    // MARK: Methods
    func initGroupSet()
    {
        groupSet.insert(Group(name: "Personal", color: UIColor.flatRed()))
        groupSet.insert(Group(name: "Work", color: UIColor.flatBlue()))
        groupSet.insert(Group(name: "Home", color: UIColor.flatGreen()))
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.bgView.backgroundColor = UIColor.black
    }
}

