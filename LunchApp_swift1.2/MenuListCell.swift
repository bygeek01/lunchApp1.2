//
//  MenuListCell.swift
//  LunchApp_swift1.2
//
//  Created by hide on 2015/07/05.
//  Copyright (c) 2015年 byGeek01. All rights reserved.
//

import Foundation
import UIKit

class MenuListCell:UICollectionViewCell {
    
    //変数設定
    var menuLabel = UILabel(frame: CGRectZero)
    var shopLabel = UILabel(frame: CGRectZero)
    var menuImage = UIImageView(frame: CGRectZero)
    private let coverView    = UIView(frame: CGRectZero)
    private let separateLine = UIView(frame: CGRectZero)
    private let rowHeight    = SettingConfig.categoryTableFrame.height/5
    
    //初期化処理
    override init(frame: CGRect) {
        super.init(frame:frame)
        //料理画像
        menuImage.contentMode     = UIViewContentMode.ScaleAspectFill
        menuImage.clipsToBounds   = true
        menuImage.backgroundColor = UIColor.grayColor()
        
        //画像右の薄膜
        coverView.backgroundColor = UIColor.blackColor()
        coverView.alpha           = 0.25
        
        //料理名ラベル
        menuLabel.font      = SettingConfig.menuNameFont
        menuLabel.textColor = UIColor.whiteColor()
        
        //罫線ラベル
        separateLine.backgroundColor = UIColor.whiteColor()
        
        //店舗名ラベル
        shopLabel.font      = SettingConfig.shopNameFont
        shopLabel.textColor = UIColor.whiteColor()
        shopLabel.numberOfLines = 0
        shopLabel.lineBreakMode = NSLineBreakMode.ByCharWrapping
        shopLabel.sizeToFit()
        
        //上記を全てcellに追加
        self.contentView.addSubview(menuImage)
        self.contentView.addSubview(coverView)
        self.contentView.addSubview(menuLabel)
        self.contentView.addSubview(separateLine)
        self.contentView.addSubview(shopLabel)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //各subviewのレイアウト設定
    override func layoutSubviews() {
        menuImage.frame = CGRect(x: SettingConfig.spaceWidth/2, y: 0, width: SettingConfig.screenWidth, height: rowHeight-3)
        coverView.frame = CGRect(x: menuImage.frame.width/2+SettingConfig.spaceWidth/2, y: menuImage.frame.origin.y, width: menuImage.frame.width/2, height: menuImage.frame.height)
        menuLabel.frame = CGRect(x: coverView.frame.origin.x+5, y: coverView.frame.height/2-10, width: coverView.frame.width, height: 30)
        separateLine.frame = CGRect(x: menuLabel.frame.origin.x, y: menuLabel.frame.origin.y+menuLabel.frame.height, width: menuLabel.frame.width-5, height: 1)
        shopLabel.frame = CGRect(x: menuLabel.frame.origin.x, y: separateLine.frame.origin.y+2, width: menuLabel.frame.width, height: 15)
    }

}