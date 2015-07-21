//
//  SettingConfig.swift
//  LunchApp_swift1.2
/**
*  各クラスで共通して使う画面幅などをstatic変数として保持するクラス
*　画面パーツは基本的にこのクラスを参照すること
*/

//
//  Created by hide on 2015/06/22.
//  Copyright (c) 2015年 byGeek01. All rights reserved.
//

import Foundation
import UIKit

class SettingConfig{
    //共通パーツサイズ
    static let screenWidth:CGFloat      = UIScreen.mainScreen().bounds.width
    static let screenHeight:CGFloat     = UIScreen.mainScreen().bounds.height
    static let navigationHeight:CGFloat = UINavigationController().navigationBar.frame.height
    static let statusBarHeight:CGFloat  = UIApplication.sharedApplication().statusBarFrame.height
    //static let topViewFrame      = CGRect(x: 0, y: 0, width: SettingConfig.screenWidth, height: 20)
    static let categoryScrollBar = CGRect(x: 0, y: SettingConfig.statusBarHeight, width: SettingConfig.screenWidth, height: 30)
    static let contentViewFrame  = CGRect(x: 0, y: SettingConfig.categoryScrollBar.origin.y+SettingConfig.categoryScrollBar.height, width: SettingConfig.screenWidth, height: SettingConfig.screenHeight-SettingConfig.statusBarHeight-SettingConfig.categoryScrollBar.height)
    static let categoryTableFrame = CGRect(x: -SettingConfig.spaceWidth/2, y: SettingConfig.contentViewFrame.origin.y, width: SettingConfig.screenWidth+SettingConfig.spaceWidth, height: SettingConfig.contentViewFrame.height)
    static let spaceWidth:CGFloat = 10
    static let toolBarHeight:CGFloat = UINavigationController().toolbar.frame.height
    
    //使用可能フォント
    static let menuNameFont = UIFont(name: "axisstd-light", size: 20)
    static let shopNameFont = UIFont(name: "axisstd-light", size: 15)
    static let detailShopNameFont = UIFont(name: "axisstd-light", size: 22)
    static let generalFont  = UIFont(name: "axisstd-light", size: 12)
    
    //使用可能カラー
    static let redColor    = UIColor(red: 226/255, green: 81/255, blue: 67/255, alpha: 1)
    static let orangeColor = UIColor(red: 246/255, green: 102/255, blue: 0/255, alpha: 1)
    static let yellowColor = UIColor(red: 243/255, green: 144/255, blue: 25/255, alpha: 1)
    
    //セルの数
    static let menuListNumber:Int     = 6
    static let categoryListNumber:Int = 5
}