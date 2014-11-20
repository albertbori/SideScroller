//
//  CardTableController.swift
//  SideScroller
//
//  Created by Albert Bori on 11/18/14.
//  Copyright (c) 2014 albertbori. All rights reserved.
//

import UIKit
import Foundation

class CardTableController: UITableViewController {
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("CardCell") as CardCell
        
        //since these cells are re-used, we have to clear out the previous dynamic subviews
        for subView in cell.scrollContentView.subviews {
            subView.removeFromSuperview()
        }
        
        var card = NSBundle.mainBundle().loadNibNamed("CardView", owner: self, options: nil)[0] as CardView
        //Turn this off because subviews of UIScrollView use autoresizing mask by default, which conflict with Auto-Layout constraints
        card.setTranslatesAutoresizingMaskIntoConstraints(false)
        cell.scrollContentView.addSubview(card)
        
        //Add bottom margin to the last cell (for consistency)
        var bottomMargin = indexPath.row == 11 ? "-" : ""
        //Add vertical and horizontal constraints (standard margins) for each card
        var constraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|-[card]\(bottomMargin)|", options: nil, metrics: nil, views: ["card": card])
        constraints += NSLayoutConstraint.constraintsWithVisualFormat("H:|-[card]-|", options: nil, metrics: nil, views: ["card": card])
        cell.scrollContentView.addConstraints(constraints)
        
        cell.contentWidthConstraint.constant = self.tableView.frame.width
        
        return cell
    }
}