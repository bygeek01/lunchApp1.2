//
//  ScrollCollectionDataSource.swift
//  LunchApp_swift1.2
/**
*  カテゴリーボタンが配置されたスクロールバーへのdataSourceクラス
*  DBから取得したデータを受け取り、各セルにカテゴリ名を表示する
*/

//  Created by hide on 2015/06/30.
//  Copyright (c) 2015年 byGeek01. All rights reserved.

import Foundation
import UIKit
import SwiftyJSON

class ScrollCollectionDataSource:NSObject,UICollectionViewDataSource {
    
    var categoryNameArray = [String]()
    
    override init(){
        super.init()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "dataLoaded:", name: "dataLoaded", object: nil)
    }
    
    func dataLoaded(notificaiton:NSNotification){
        if let userInfo = notificaiton.userInfo{
            let shopInfo    = JSON(userInfo["loadedData"]!)
            let categoryNum = shopInfo["total_rows"].int
            for var i=0; i<categoryNum; i++ {
                let categoryName = shopInfo["rows"][i]["category"].string
                categoryNameArray.append(categoryName!)
            }
        }
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 6
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("categoryButton", forIndexPath: indexPath) as! ScrollCollectionCell

        if categoryNameArray.count == 0{
            cell.categoryLabel.text = "category\(indexPath.section)"
        }else{
            cell.categoryLabel.text = categoryNameArray[indexPath.section]
        }
        cell.categoryLabel.font = SettingConfig.shopNameFont
        cell.categoryLabel.textAlignment = NSTextAlignment.Center
        return cell
    }
    
    
    
}