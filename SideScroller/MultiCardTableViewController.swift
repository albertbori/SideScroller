//
//  MultiCardTableViewController.swift
//  SideScroller
//
//  Created by Albert Bori on 11/20/14.
//  Copyright (c) 2014 albertbori. All rights reserved.
//

import UIKit
import Foundation

    class MultiCardTableViewController: UITableViewController {

        override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 12
        }

        override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCellWithIdentifier("CardCell", forIndexPath: indexPath) as CardCell
            
            if indexPath.row % 3 == 0 {
                //since these cells are re-used, we have to clear out the previous dynamic subviews
                for subView in cell.scrollContentView.subviews {
                    subView.removeFromSuperview()
                }
                
                var card = NSBundle.mainBundle().loadNibNamed("CardView", owner: self, options: nil)[0] as CardView
                //Turn this off because subviews of UIScrollView use autoresizing mask by default, which conflict with Auto-Layout constraints
                card.setTranslatesAutoresizingMaskIntoConstraints(false)
                cell.scrollContentView.addSubview(card)
                
                var card2 = NSBundle.mainBundle().loadNibNamed("CardView", owner: self, options: nil)[0] as CardView
                //Turn this off because subviews of UIScrollView use autoresizing mask by default, which conflict with Auto-Layout constraints
                card2.setTranslatesAutoresizingMaskIntoConstraints(false)
                cell.scrollContentView.addSubview(card2)
                
                var card3 = NSBundle.mainBundle().loadNibNamed("CardView", owner: self, options: nil)[0] as CardView
                //Turn this off because subviews of UIScrollView use autoresizing mask by default, which conflict with Auto-Layout constraints
                card3.setTranslatesAutoresizingMaskIntoConstraints(false)
                cell.scrollContentView.addSubview(card3)
                
                //Add bottom margin to the last cell (for consistency)
                var bottomMargin = indexPath.row == 11 ? "-" : ""
                //Add vertical constraints (standard margins) for each card
                var constraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|-[card]\(bottomMargin)|", options: nil, metrics: nil, views: ["card": card])
                constraints += NSLayoutConstraint.constraintsWithVisualFormat("V:|-[card2]\(bottomMargin)|", options: nil, metrics: nil, views: ["card2": card2])
                constraints += NSLayoutConstraint.constraintsWithVisualFormat("V:|-[card3]\(bottomMargin)|", options: nil, metrics: nil, views: ["card3": card3])
                //Add horizontal constraints that tie the cards together, and to the super view
                constraints += NSLayoutConstraint.constraintsWithVisualFormat("H:|-[card(==card2)]-(16)-[card2(==card3)]-(16)-[card3]-|", options: nil, metrics: nil, views: ["card": card, "card2": card2, "card3": card3])
                cell.scrollContentView.addConstraints(constraints)
                
                //Set the scrollview content horizontal size constraint to double the window width (1 window width for each card)
                cell.contentWidthConstraint.constant = self.tableView.frame.width * 3
            } else if indexPath.row % 2 == 0 {
                //since these cells are re-used, we have to clear out the previous dynamic subviews
                for subView in cell.scrollContentView.subviews {
                    subView.removeFromSuperview()
                }
                
                var card = NSBundle.mainBundle().loadNibNamed("CardView", owner: self, options: nil)[0] as CardView
                //Turn this off because subviews of UIScrollView use autoresizing mask by default, which conflict with Auto-Layout constraints
                card.setTranslatesAutoresizingMaskIntoConstraints(false)
                cell.scrollContentView.addSubview(card)
                
                var card2 = NSBundle.mainBundle().loadNibNamed("CardView", owner: self, options: nil)[0] as CardView
                //Turn this off because subviews of UIScrollView use autoresizing mask by default, which conflict with Auto-Layout constraints
                card2.setTranslatesAutoresizingMaskIntoConstraints(false)
                cell.scrollContentView.addSubview(card2)
                
                //Add bottom margin to the last cell (for consistency)
                var bottomMargin = indexPath.row == 11 ? "-" : ""
                //Add vertical constraints (standard margins) for each card
                var constraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|-[card]\(bottomMargin)|", options: nil, metrics: nil, views: ["card": card])
                constraints += NSLayoutConstraint.constraintsWithVisualFormat("V:|-[card2]\(bottomMargin)|", options: nil, metrics: nil, views: ["card2": card2])
                //Add horizontal constraints that tie the cards together, and to the super view
                constraints += NSLayoutConstraint.constraintsWithVisualFormat("H:|-[card(==card2)]-(16)-[card2]-|", options: nil, metrics: nil, views: ["card": card, "card2": card2])
                cell.scrollContentView.addConstraints(constraints)
                
                //Set the scrollview content horizontal size constraint to double the window width (1 window width for each card)
                cell.contentWidthConstraint.constant = self.tableView.frame.width * 2
            } else {
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
            }
            
            return cell
        }
    }
