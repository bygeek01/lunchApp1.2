//
//  DetailViewDataSource.swift
//  LunchApp_swift1.2
//
//  Created by hide on 2015/07/08.
//  Copyright (c) 2015年 byGeek01. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class DetailViewDataSource:NSObject,UITableViewDataSource {
    
    var tapListCellIndex:NSIndexPath?
    var shopDataArray = [JSON]()
    
    //DBconnectionにて取得したデータを受け取る
    func loadedData(notification:NSNotification){
        if let userInfo = notification.userInfo{
            let loadedData = JSON(userInfo["loadedData"]!)
            let dataCount = loadedData["total_rows"].int
            for var i=0; i<dataCount; i++ {
                let shopList = loadedData["rows"][i]
                shopDataArray.append(shopList)
            }
        }
    }
    
    //一覧画面でタップしたindexPath情報を受け取る
    func listTappedInfo(notification:NSNotification){
        if let userInfo = notification.userInfo{
            let test = userInfo["tapIndexPath"]!.section
            let test2 = userInfo["tapIndexPath"]!.row
            self.tapListCellIndex = NSIndexPath(forRow: test2, inSection: test)
        }
    }
    
    //section数の設定
    //sectionは分けてもいいかも
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    //セクションごとのセル数の設定
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    //各行の表示内容設定
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch(indexPath.row){
        case 0:
            println("\(tapListCellIndex?.section)がタップされました")
            let cell = tableView.dequeueReusableCellWithIdentifier("menuImageCell", forIndexPath: indexPath) as! MenuImageViewCell
            if tapListCellIndex != nil{
                var urlStr = shopDataArray[tapListCellIndex!.section]["shopInfo"][tapListCellIndex!.row]["imgURL"].string
                let url = NSURL(string: urlStr!)
                cell.menuImageView.sd_setImageWithURL(url, placeholderImage: nil, options: .CacheMemoryOnly)
            }
//            let url = NSURL(string: "http://tabelog.com/imgview/original?id=r5425938610612")
//            cell.menuImageView.sd_setImageWithURL(url, placeholderImage: nil, options: .CacheMemoryOnly)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCellWithIdentifier("shopNameCell", forIndexPath: indexPath) as! ShopNameViewCell
            
            if tapListCellIndex != nil{
                var shopName = shopDataArray[tapListCellIndex!.section]["shopInfo"][tapListCellIndex!.row]["shopName"].string!
                cell.shopNameLabel.text = shopName
            }
            cell.shopTextField.text = "口コミデータから抽出した情報を表示する。"
            return cell
        default:
            let cell = tableView.dequeueReusableCellWithIdentifier("mapCell", forIndexPath: indexPath) as! MapViewCell
            return cell
        }
    }
    
}