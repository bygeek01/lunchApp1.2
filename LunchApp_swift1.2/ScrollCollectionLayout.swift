//
//  ScrollCollectionLayout.swift
//  LunchApp_swift1.2
//
//  Created by hide on 2015/06/30.
//  Copyright (c) 2015年 byGeek01. All rights reserved.
//

import Foundation
import UIKit

class ScrollCollectionLayout:UICollectionViewFlowLayout {

    override init() {
        super.init()
        self.scrollDirection         = .Horizontal
        self.itemSize                = CGSize(width: SettingConfig.screenWidth/3, height: 30)
        self.minimumLineSpacing      = 0
        self.minimumInteritemSpacing = 0
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func collectionViewContentSize() -> CGSize {
        let contentSize = CGSize(width: SettingConfig.screenWidth*2, height: 30)
        return contentSize
    }
    
    
    
    //無限スクロール
    
    //スクロールした際に、セルを一つずつページングさせる
    override func targetContentOffsetForProposedContentOffset(proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        //proposedoffsetはユーザが手を離した瞬間のoffset
        return CGPoint(x: proposedContentOffset.x, y: proposedContentOffset.y)
    }
}
    