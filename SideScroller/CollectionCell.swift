//
//  CollectionCell.swift
//  SideScroller
//
//  Created by Albert Bori on 12/3/14.
//  Copyright (c) 2014 albertbori. All rights reserved.
//

import UIKit
import Foundation

class CollectionCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource
{
    @IBOutlet weak var collectionView: UICollectionView!
    
    var cellCount = 0
    var cellWidth: CGFloat!
    
    func configureCell(width: CGFloat)
    {
        cellWidth = width
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.registerNib(UINib(nibName: "CollectionCardCell", bundle: NSBundle.mainBundle()), forCellWithReuseIdentifier: "CollectionCardCell")
        cellCount = Int(arc4random_uniform(5)) + 1
        
        var layout = collectionView.collectionViewLayout as UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: cellWidth, height: 150)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        collectionView.setCollectionViewLayout(layout, animated: false)
        collectionView.pagingEnabled = true

    }
    
    //MARK - UICollectionViewDataSource
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return cellCount
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionCardCell", forIndexPath: indexPath) as CollectionCardCell
        
        return cell
    }
}
