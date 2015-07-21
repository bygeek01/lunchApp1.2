//
//  ShopNameViewCell.swift
//  LunchApp_swift1.2
//
//  Created by hide on 2015/07/08.
//  Copyright (c) 2015年 byGeek01. All rights reserved.
//

//   詳細tableview１行目cell
//   店舗名および店舗説明文、基本情報を表示する

import Foundation
import UIKit
import QuartzCore

class ShopNameViewCell:UITableViewCell {
    
    var shopNameLabel = UILabel(frame: CGRectZero)
    var shopTextField = UITextView(frame: CGRectZero)
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(shopNameLabel)
        self.contentView.addSubview(shopTextField)
        self.selectionStyle = UITableViewCellSelectionStyle.None
        //labelの設定
        shopNameLabel.sizeToFit()
        shopNameLabel.font      = SettingConfig.detailShopNameFont
        shopNameLabel.textColor = UIColor.blackColor()
        //textFieldの設定
        shopTextField.sizeToFit()
        shopTextField.font      = SettingConfig.generalFont
        shopTextField.textColor = UIColor.blackColor()
        shopTextField.textAlignment = NSTextAlignment.Left
        //shopTextField.backgroundColor = UIColor.grayColor()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        shopNameLabel.frame = CGRect(x: 5, y: 5, width: SettingConfig.screenWidth-5, height: 50)
        shopTextField.frame = CGRect(x: 5, y: shopNameLabel.frame.origin.y+shopNameLabel.frame.height+5, width: SettingConfig.screenWidth/2-10, height: self.frame.height/3*2-5)
    }
    
}