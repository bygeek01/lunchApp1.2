//
//  DetailTableView.swift
//  LunchApp_swift1.2
//
//  Created by hide on 2015/07/08.
//  Copyright (c) 2015年 byGeek01. All rights reserved.
//

import Foundation
import UIKit

class DetailTableView:UITableView,UITableViewDelegate {
    
    let detailTableDataSource = DetailViewDataSource()
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        self.delegate = self
        self.dataSource         = detailTableDataSource
        self.layer.cornerRadius = 4.0
        self.separatorColor     = UIColor.clearColor()
        self.backgroundColor    = UIColor.blackColor()
        self.bounces = false
        self.registerClass(MenuImageViewCell.self, forCellReuseIdentifier: "menuImageCell")
        self.registerClass(ShopNameViewCell.self, forCellReuseIdentifier: "shopNameCell")
        self.registerClass(MapViewCell.self, forCellReuseIdentifier: "mapCell")
        NSNotificationCenter.defaultCenter().addObserver(detailTableDataSource, selector: "listTappedInfo:", name: "cellTapped", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(detailTableDataSource, selector: "loadedData:", name: "dataLoaded", object: nil)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //行ごとの高さ設定
    //adapterクラスをかませるか
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch(indexPath.row){
        case 0:
            return SettingConfig.screenHeight/3
        case 1:
            return SettingConfig.screenHeight/3-10
        default:
            return SettingConfig.screenHeight/3+10
        }
    }
    
    
    
}