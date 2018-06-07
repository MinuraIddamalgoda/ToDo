//
//  GroupCollectionViewCell.swift
//  ToDo
//
//  Created by Minura Iddamalgoda on 7/6/18.
//  Copyright © 2018 Minura Iddamalgoda. All rights reserved.
//

import UIKit

class GroupCollectionViewCell: UICollectionViewCell {
    // MARK: - Public API
    var group : Group! {
        didSet {
            updateUI()
        }
    }
    
    // MARK: - Private
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var groupCollectionViewCellBgView: UIView!
    
    private func updateUI() {
        nameLabel?.text! = group.name
        groupCollectionViewCellBgView?.backgroundColor! = group.color
    }
}
