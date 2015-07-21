//
//  MapViewCell.swift
//  LunchApp_swift1.2
//
//  Created by hide on 2015/07/08.
//  Copyright (c) 2015年 byGeek01. All rights reserved.
//

// mapview

import Foundation
import UIKit

class MapViewCell:UITableViewCell {
    
    let map = MapView(frame: CGRectZero)
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(map)
        self.selectionStyle = UITableViewCellSelectionStyle.None
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        map.frame = CGRect(x: 5, y: 5, width: SettingConfig.screenWidth-SettingConfig.spaceWidth, height: SettingConfig.screenHeight/3)
    }
    
    
}