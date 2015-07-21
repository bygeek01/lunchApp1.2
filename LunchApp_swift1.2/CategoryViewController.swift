//
//  CategoryViewController.swift
//  LunchApp_swift1.2
/**
*  起動時に表示される一覧画面のVC
*  各メニューカテゴリが配置されたcollectionviewと、メニュー画像を表示するcolletionviewを管理する
*/

//
//  Created by 堀之内英典 on 2015/06/23.
//  Copyright (c) 2015年 byGeek01. All rights reserved.
//

import Foundation
import UIKit

class CategoryViewController:UIViewController {
    
    //**subview**
    let categoryScrollBar = ScrollCollectionView(frame: CGRectZero, collectionViewLayout: ScrollCollectionLayout())
    let categoryListTable = TableCollectionView(frame: CGRectZero, collectionViewLayout: TableCollectionLayout())
    let barButton = UIBarButtonItem()
    
    //**nextViewController**
    let detailViewController = DetailWindowViewController()
    
    //初期化処理
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(categoryScrollBar)
        self.view.addSubview(categoryListTable)

        //navigationBar関連
        self.automaticallyAdjustsScrollViewInsets = true
        self.navigationController?.navigationBarHidden = true
        barButton.title = ""
        self.navigationItem.backBarButtonItem = barButton

        //tableViewCellのタップ通知を受け取る
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "switchToDetail:", name: "cellTapped", object: nil)
        
        //scrollBar→tableViewへのdelegate
        //tableviewクラス自体でdelegate登録したいが、nilになるためこのクラスで登録してるが適切か?
        categoryScrollBar.viewScrollDelegate = categoryListTable
        categoryListTable.scrollBarDelegate  = categoryScrollBar
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
        //self.navigationController?.toolbarHidden = true
    }
    
    //subviewの配置を設定する
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        categoryScrollBar.frame = SettingConfig.categoryScrollBar
        categoryListTable.frame = SettingConfig.categoryTableFrame
    }
    
    //tableCellのタップイベントを受け取り、detailWindowに遷移する
    //VC間でのデータ連携を実装する(VC間でindexpathを渡す以外にできるか）
    //detailVC→各viewへのindexPathの連携をどうするか
    func switchToDetail(notification:NSNotification?) {
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}