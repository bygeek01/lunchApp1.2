//
//  ScrollCollectionCell.swift
//  LunchApp_swift1.2
//
//  Created by hide on 2015/06/30.
//  Copyright (c) 2015年 byGeek01. All rights reserved.
//

import Foundation
import UIKit

class ScrollCollectionCell:UICollectionViewCell {

    let categoryLabel = UILabel()
    //let selectedView  = UIView(frame: CGRectZero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius      = 3.0
        self.contentView.addSubview(categoryLabel)
        //selectedView.backgroundColor = UIColor.orangeColor()
        //self.selectedBackgroundView  = selectedView
        categoryLabel.highlightedTextColor = UIColor.redColor()
        categoryLabel.textColor            = UIColor.grayColor()
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        categoryLabel.frame = CGRect(x: 0, y: 0, width: SettingConfig.screenWidth/3, height: 30)
    }
    
}