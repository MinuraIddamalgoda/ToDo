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
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth: CGFloat = bgView.bounds.size.width
        let currentPage: Int = Int( floor( (scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1)
        
        let maxHorizontalOffset: CGFloat = collectionView.contentSize.width - collectionView.frame.width
        let currentHorizontalOffset: CGFloat = scrollView.contentOffset.x
        
        let percentageHorizontalOffset: CGFloat = currentHorizontalOffset / maxHorizontalOffset
        
        if percentageHorizontalOffset < 0.5 {
            bgView.backgroundColor = fadeFromColor(fromColor: groups[currentPage].color, toColor: groups[currentPage + 1].color, withPercentage: percentageHorizontalOffset)
        } else {
             bgView.backgroundColor = fadeFromColor(fromColor: groups[currentPage - 1].color, toColor: groups[currentPage].color, withPercentage: percentageHorizontalOffset)
        }
    }
    
    private func fadeFromColor(fromColor: UIColor, toColor: UIColor, withPercentage: CGFloat) -> UIColor {
        var fromRed: CGFloat = 0.0
        var fromGreen: CGFloat = 0.0
        var fromBlue: CGFloat = 0.0
        var fromAlpha: CGFloat = 0.0
        
        fromColor.getRed(&fromRed, green: &fromGreen, blue: &fromBlue, alpha: &fromAlpha)
        
        var toRed: CGFloat = 0.0
        var toGreen: CGFloat = 0.0
        var toBlue: CGFloat = 0.0
        var toAlpha: CGFloat = 0.0
        
        toColor.getRed(&toRed, green: &toGreen, blue: &toBlue, alpha: &toAlpha)
        
        // Calculate the actual RGBA values of the fade colour
        let red = (toRed - fromRed) * withPercentage + fromRed
        let green = (toGreen - fromGreen) * withPercentage + fromGreen
        let blue = (toBlue - fromBlue) * withPercentage + fromBlue
        let alpha = (toAlpha - fromAlpha) * withPercentage + fromAlpha
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        // Determine the index of the new page
//        let pageWidth = collectionView.frame.size.width
//        let index: Int = Int(collectionView.contentOffset.x / pageWidth)
//        changeBackground(index: index)
//    }
}
