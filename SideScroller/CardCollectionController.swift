//
//  CardCollectionController.swift
//  SideScroller
//
//  Created by Albert Bori on 12/3/14.
//  Copyright (c) 2014 albertbori. All rights reserved.
//

import UIKit
import Foundation

class CardCollectionTableController: UITableViewController
{    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CollectionCell", forIndexPath: indexPath) as CollectionCell
        
        cell.configureCell(tableView.frame.width)
        
        return cell
    }
}
