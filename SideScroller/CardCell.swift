//
//  CardCell.swift
//  SideScroller
//
//  Created by Albert Bori on 11/20/14.
//  Copyright (c) 2014 albertbori. All rights reserved.
//

import UIKit

class CardCell: UITableViewCell
{
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollContentView: UIView!
    @IBOutlet weak var contentWidthConstraint: NSLayoutConstraint!
}
