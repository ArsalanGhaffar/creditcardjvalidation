//
//  BorderButton.swift
//  creditcardjvalidation
//
//  Created by Arsalan on 01/06/2016.
//  Copyright © 2016 Arsalan. All rights reserved.
//

import Foundation
import UIKit


class BorderedButton: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.borderWidth = 1.0
        layer.borderColor = tintColor.CGColor
        layer.cornerRadius = 5.0
        clipsToBounds = true
        contentEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        setTitleColor(UIColor.whiteColor(), forState: .Normal)
        setTitleColor(UIColor.grayColor(), forState: .Highlighted)
//        setBackgroundImage(UIImage(color: tintColor), forState: .Highlighted)
    }
}