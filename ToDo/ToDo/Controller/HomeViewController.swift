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

extension HomeViewController : UICollectionViewDataSource,
                    UICollectionViewDelegateFlowLayout,
                    UIScrollViewDelegate {
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        // Determine the index of the new page
        let pageWidth = collectionView.frame.size.width
        let index: Int = Int(collectionView.contentOffset.x / pageWidth)
        
        // Get content
        let currentContent = groups[index]
        let backgroundColor = groups[index].color
        
        // Transition animation
        UIView.transition(with: bgView, duration: 0.8, options: .transitionCrossDissolve, animations: {
            self.bgView.backgroundColor = backgroundColor
        }, completion: nil)
    }
}
