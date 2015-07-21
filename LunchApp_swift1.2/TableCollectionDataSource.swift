//
//  TableCollectionDataSource.swift
//  LunchApp_swift1.2
//
//  Created by hide on 2015/07/01.
//  Copyright (c) 2015年 byGeek01. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class TableCollectionDataSource:NSObject,UICollectionViewDataSource {
    
    var imageURLArray = [String]()
    var shopNameArray = [String]()
    var shopDataArray = [JSON]()
    
    override init() {
        super.init()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "dataLoaded:", name: "dataLoaded", object: nil)
    }
    
    //DBから取得したデータを通知で受け取る
    //もっといい渡し方があるはず
    func dataLoaded(notification:NSNotification){
        if let userInfo = notification.userInfo{
            let loadedData = JSON(userInfo["loadedData"]!)
            let dataCount = loadedData["total_rows"].int
            for var i=0; i<dataCount; i++ {
                let shopList = loadedData["rows"][i]
//                let shopListCount = shopList.count
//                for var j=0; j<shopListCount; j++ {
//                    let imgURLList   = shopList[j]["imgURL"].string
//                    let shopNameList = shopList[j]["shopName"].string
//                    imageURLArray.append(imgURLList!)
//                    shopNameArray.append(shopNameList!)
//                }
                shopDataArray.append(shopList)
            }
        }
    }
    
    //ページ数(データ取得後はカテゴリ数を設定)
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 6
    }
    
    //１ページあたりの表示件数(ここは５件で固定)
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    //各セルの表示内容
    //sectionごとに使うデータを変更したいが、switch文では長くなるので良い方法がないか検討中
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("categoryTable", forIndexPath: indexPath) as! MenuListCell
        //この方法だと画像の読み込みが遅い
        if shopDataArray.count == 0{
            cell.menuLabel.text = "menu\(indexPath.section)-\(indexPath.row)"
            cell.shopLabel.text = "shop\(indexPath.section)-\(indexPath.row)"
        }else{
            switch(indexPath.section){
            case var n where n == indexPath.section:
                cell.menuLabel.text = "menu\(indexPath.section)-\(indexPath.row)"
                cell.shopLabel.text = shopDataArray[indexPath.section]["shopInfo"][indexPath.row]["shopName"].string
                let urlStr = shopDataArray[indexPath.section]["shopInfo"][indexPath.row]["imgURL"].string!
                let url = NSURL(string: urlStr)
                cell.menuImage.sd_setImageWithURL(url, placeholderImage: nil, options: .CacheMemoryOnly)
                return cell
            default:
                cell.menuLabel.text = "menu\(indexPath.section)-\(indexPath.row)"
                return cell
            }

        }
        return cell
    }
    
    
}