//
//  ViewController.swift
//  ToDo
//
//  Created by Minura Iddamalgoda on 5/6/18.
//  Copyright © 2018 Minura Iddamalgoda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var bgView: UIView!
    
    // MARK: IBActions
    @IBAction func redPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5) {
            self.bgView.backgroundColor = UIColor.flatRed()
        }
    }
    
    @IBAction func greenPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5) {
            self.bgView.backgroundColor = UIColor.flatGreen()
        }    }

    @IBAction func bluePressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5) {
            self.bgView.backgroundColor = UIColor.flatBlue()
        }    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.bgView.backgroundColor = UIColor.black
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

