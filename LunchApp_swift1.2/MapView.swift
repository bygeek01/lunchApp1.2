//
//  MapView.swift
//  LunchApp_swift1.2
//
//  Created by hide on 2015/07/08.
//  Copyright (c) 2015年 byGeek01. All rights reserved.
//

import Foundation
import MapKit

class MapView:MKMapView,MKMapViewDelegate {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.delegate = self
        var centerCoordinate : CLLocationCoordinate2D = CLLocationCoordinate2DMake(35.665213,139.730011)
        let span = MKCoordinateSpanMake(0.003, 0.003) //小さい値であるほど近づく
        //任意の場所を表示する場合、MKCoordinateRegionを使って表示する -> (中心位置、表示領域)
        var centerPosition = MKCoordinateRegionMake(centerCoordinate, span)
        self.setRegion(centerPosition,animated:true)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}