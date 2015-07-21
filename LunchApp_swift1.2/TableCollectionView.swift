//
//  TableCollectionView.swift
//  LunchApp_swift1.2
//
/**
*  メニューバー下部に表示されているメニュー画像を表示するcollectionView
*   6section*5itemで構成されており、１画面=1sectionで切り分けている
    メモリ管理が容易なことからcollectionViewを選択
*/
//  Created by hide on 2015/07/01.
//  Copyright (c) 2015年 byGeek01. All rights reserved.
//

import Foundation
import UIKit

protocol ScrollBarDelegate{
    func targetScroll(pageNumber:NSIndexPath)
}

class TableCollectionView:UICollectionView,UICollectionViewDelegate,ViewScrollDelegate {
    
    let categoryDataSource = TableCollectionDataSource()
    var scrollBarDelegate:ScrollBarDelegate?
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.delegate        = self
        self.dataSource      = categoryDataSource
        self.backgroundColor = UIColor.whiteColor()
        self.pagingEnabled   = true
        self.showsHorizontalScrollIndicator = false
        self.registerClass(MenuListCell.self, forCellWithReuseIdentifier: "categoryTable")
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "dataLoaded:", name: "dataLoaded", object: nil)
    }
    
    //データ取得時の処理
    func dataLoaded(notification:NSNotification){
        self.reloadData()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //セル選択時処理
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        NSNotificationCenter.defaultCenter().postNotificationName("cellTapped", object: nil, userInfo: ["tapIndexPath":indexPath])
    }
    
    //scrollBarのセルがタップされた場合に、該当するページまでスクロールさせる
    func targetView(viewNumber: NSIndexPath) {
        let pageWidth = self.frame.width
        let currentPage = Int(self.contentOffset.x/pageWidth)

        switch abs(viewNumber.section-currentPage){
        case 0:
            println("現在ページです")
            //処理なし
        case 1:
            println("隣のページがタップ")
            self.scrollToItemAtIndexPath(viewNumber, atScrollPosition: UICollectionViewScrollPosition.CenteredHorizontally, animated: true)
        default:
            println("2ページ以上離れたページがタップ")
            //タップされたメニューページを隣に配置し
            //offsetを隣ページに設定しアニメーション←delegateで処理
            //どの方法で実現すべきか検討中・・・
            self.scrollToItemAtIndexPath(viewNumber, atScrollPosition: UICollectionViewScrollPosition.CenteredHorizontally, animated: true)
        }
    
    }
    
    //画面をスクロールした際に、scrollBarに現在ページを連携する
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let pageWidth   = scrollView.frame.width
        let currentPage = Int(scrollView.contentOffset.x/pageWidth)
        let pageIndexPath:NSIndexPath = NSIndexPath(forRow: 0, inSection: currentPage)
        scrollBarDelegate?.targetScroll(pageIndexPath)
    }
    
    //scrollを開始した時点でscrollBarも連動させたい
    //左右どちらにscrollしたか判断しなければならず、scroll開始時点のスワイプ方向と、最終的に違う可能性もある
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        let pageWidth   = scrollView.frame.width
        let currentPage = Int(scrollView.contentOffset.x/pageWidth)
        let pageIndexPath:NSIndexPath = NSIndexPath(forRow: 0, inSection: currentPage)
        println("現在\(currentPage)ページ目です")
        scrollBarDelegate?.targetScroll(pageIndexPath)
    }

    
}