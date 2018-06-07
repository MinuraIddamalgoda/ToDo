//
//  HomeViewController.swift
//  ToDo
//
//  Created by Minura Iddamalgoda on 7/6/18.
//  Copyright © 2018 Minura Iddamalgoda. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var cellNameLabel: UILabel!
    
    // MARK: - UICollectionViewDataSource
    var groups = Group.createGroups()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    private struct Storyboard {
        static let CellIdentifier = "Group Cell"
    }
}

extension HomeViewController : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.CellIdentifier, for: indexPath) as! GroupCollectionViewCell
        cell.group = self.groups[indexPath.item]
        print("Name: \(cell.group.name)\n")
        return cell
    }
}
