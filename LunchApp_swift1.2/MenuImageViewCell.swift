//
//  DetailViewCell-0.swift
//  LunchApp_swift1.2
//
//  Created by hide on 2015/07/08.
//  Copyright (c) 2015年 byGeek01. All rights reserved.
//

// 詳細tableviewの０行目に設定するメニュー画像用cell
//　セルのメタ設定のみ行い、表示する内容についてはdatasourceが担当
// 人気メニュー３品程度の画像を自動スライドショー形式で表示させる

import Foundation
import UIKit

class MenuImageViewCell:UITableViewCell {
    
    let menuImageView = UIImageView(frame: CGRectZero)
    let gradientView  = UIView(frame: CGRectZero)
    let gradientLayer = CAGradientLayer()
    var menuText = CATextLayer()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = UITableViewCellSelectionStyle.None
        self.contentView.addSubview(menuImageView)
        //menuimageへの設定,グラデーションviewを追加
        menuImageView.contentMode     = UIViewContentMode.ScaleAspectFill
        menuImageView.clipsToBounds   = true
        //menuimageにグラデーションviewを追加する
        let startColor  = UIColor(white: 1.0, alpha: 0.2).CGColor
        let centerColor = UIColor(white: 0.0, alpha: 0.15).CGColor
        let endColor    = UIColor(white: 0.0, alpha: 0.6).CGColor
        gradientLayer.colors = [startColor,centerColor,endColor]
        menuImageView.layer.addSublayer(gradientLayer)
        //textLayer
        menuText.string = "test"
        menuText.font   = SettingConfig.menuNameFont
        menuText.foregroundColor = UIColor.whiteColor().CGColor
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        menuImageView.frame = CGRect(x: 0, y: 0, width: SettingConfig.screenWidth, height: SettingConfig.screenHeight/3)
        gradientView.frame  = menuImageView.frame
        gradientLayer.frame = menuImageView.frame
        
    }
    
}