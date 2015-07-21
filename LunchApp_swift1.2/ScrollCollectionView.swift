//
//  ScrollCollectionView.swift
//  LunchApp_swift1.2
//
/**
*  画面上部に表示されるカテゴリスクロールバー
    collectionviewで設計されている
    scrollBarフォルダに格納されているクラスを必要とする
*
*/
//  Created by hide on 2015/06/30.
//  Copyright (c) 2015年 byGeek01. All rights reserved.
//

import Foundation
import UIKit

//scrollbar上のタップしたセルのindexpathをtableviewに連携する
protocol ViewScrollDelegate {
    func targetView(viewNumber:NSIndexPath)
}

class ScrollCollectionView:UICollectionView,UICollectionViewDelegate,ScrollBarDelegate {
    
    let collectionDataSource = ScrollCollectionDataSource()
    var viewScrollDelegate:ViewScrollDelegate?
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.dataSource      = collectionDataSource
        self.delegate        = self
        self.layer.cornerRadius = 3.0
        self.backgroundColor = UIColor.whiteColor()
        self.showsHorizontalScrollIndicator = false
        self.registerClass(ScrollCollectionCell.self, forCellWithReuseIdentifier: "categoryButton")
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "dataLoaded:", name: "dataLoaded", object: nil)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func dataLoaded(notification:NSNotification){
        self.reloadData()
    }

    //UICollection上に設置したボタンがスクロールするように設定
    override func touchesShouldCancelInContentView(view: UIView!) -> Bool {
        if(view.isKindOfClass(UIButton)){
            return true
        }
        return super.touchesShouldCancelInContentView(view)
    }
    
    //タップしたセルまでスクロールさせる
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        self.scrollToItemAtIndexPath(indexPath, atScrollPosition: UICollectionViewScrollPosition.CenteredHorizontally, animated: true)
        //delegateメソッドを呼び出す
        self.viewScrollDelegate?.targetView(indexPath)
    }
    
    //viewTableスワイプ時の処理
    func targetScroll(pageNumber: NSIndexPath) {
        //todo
        //現在選択されているセルがあるか調べる
        
        self.scrollToItemAtIndexPath(pageNumber, atScrollPosition: .CenteredHorizontally, animated: true)
        self.cellForItemAtIndexPath(pageNumber)?.selected = true

    }
    
}