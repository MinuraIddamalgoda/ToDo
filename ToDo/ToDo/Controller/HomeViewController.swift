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
    var groups: [Group]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.groups = Group.createGroups()
        // Set the background to the starting index
        changeBackground(index: 0)
    }
    
    private func changeBackground(index: Int) {
        UIView.transition(with: bgView, duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.bgView.backgroundColor = self.groups[index].color
        }, completion: nil)
    }
}

extension HomeViewController :
                    UICollectionViewDataSource,
                    UICollectionViewDelegateFlowLayout,
                    UIScrollViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.GroupCellIdentifier, for: indexPath) as! GroupCollectionViewCell
        cell.group = self.groups[indexPath.item]
        print("Name: \(cell.group.name)\n")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        // Determine the index of the new page
        let pageWidth = collectionView.frame.size.width
        let index: Int = Int(collectionView.contentOffset.x / pageWidth)
        changeBackground(index: index)
    }
}
