//
//  DetailWindowViewController.swift
//  LunchApp_swift1.2
//
/**
*  一覧画面上のセルをタップした場合に、遷移してくる詳細画面を管理するVC
    詳細画面は３行のtableViewで設計しており、各行内容は下記の通り
    0行目=メニュー画像の表示エリア
    1行目=店舗名等の基本情報表示エリア
    2行目=マップエリア
    各行ごとにVCを分けてそれぞれのviewで管理してもよいが、煩雑なため現段階ではtableviewで構築
*
*/
//  Created by hide on 2015/07/05.
//  Copyright (c) 2015年 byGeek01. All rights reserved.
//

import Foundation
import UIKit

class DetailWindowViewController:UIViewController {
    
    //let detailCollectionView = DetailCollectionView(frame: CGRectZero, collectionViewLayout: DetailCollectionLayout())
    
    let detailCollectionView = DetailTableView(frame: CGRectZero, style: UITableViewStyle.Plain)
    var testPath:NSIndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blackColor()
        //navigationBarを透明にする
        self.navigationController?.navigationBarHidden        = false
        let backImage = UIImage()
        self.navigationController?.navigationBar.setBackgroundImage(backImage, forBarMetrics: .Default)
        self.navigationController?.navigationBar.shadowImage        = backImage
        self.navigationController?.navigationBar.translucent        = true
        self.navigationController?.navigationBar.layer.cornerRadius = 3.0
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.view.addSubview(detailCollectionView)
        //navigationBarの真下に潜り込ませる
        self.automaticallyAdjustsScrollViewInsets = false
    }
    
    override func viewDidLayoutSubviews() {
        //detailCollectionView.frame = CGRect(x: -SettingConfig.spaceWidth/2, y: 0, width: SettingConfig.screenWidth+SettingConfig.spaceWidth, height: SettingConfig.screenHeight)
        detailCollectionView.frame = CGRect(x: 0, y: 0, width: SettingConfig.screenWidth, height: SettingConfig.screenHeight)
    }
    
    //tableviewが表示されるたびに、表示データをreloadする
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
        detailCollectionView.reloadData()
    }
    
    
    
}