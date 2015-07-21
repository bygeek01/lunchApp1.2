//
//  TableCollectionLayout.swift
//  LunchApp_swift1.2
//
//  Created by hide on 2015/07/01.
//  Copyright (c) 2015年 byGeek01. All rights reserved.
//


import Foundation
import UIKit

class TableCollectionLayout:UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        self.itemSize = CGSize(width: SettingConfig.screenWidth+SettingConfig.spaceWidth, height: SettingConfig.categoryTableFrame.height/5)
        self.minimumLineSpacing      = 0
        self.minimumInteritemSpacing = 0
        self.scrollDirection         = .Horizontal
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //アイテム取得後はカテゴリ数をかける
    override func collectionViewContentSize() -> CGSize {
        let tableContentSize = CGSize(width: (SettingConfig.screenWidth+SettingConfig.spaceWidth)*6, height: self.itemSize.height)
        return tableContentSize
    }
    
}