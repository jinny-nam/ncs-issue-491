//
//  CustomNavigationVC.swift
//  MapboxNavigation-SPM
//
//  Created by Zhou Hao on 5/4/22.
//  Copyright © 2022 Mapbox. All rights reserved.
//

import CoreLocation
import Foundation
import UIKit
import MapboxCoreNavigation
import MapboxDirections
import MapboxNavigation
import MapboxDirections
import MapboxMaps
import MapboxCoreMaps
import Turf
import Combine

final class CustomNavigationVC: NavigationViewController {

    // MARK: - Constatns
    let xTrailing: CGFloat = 12
    
    // MARK: - Properties
//    weak var endRouteDelegate: TurnByTurnNavigationVCDelegate?
    var topBannerVC: TopBannerViewController!
    
    // MARK: Internal properties
        
    internal lazy var pointAnnotationManager: PointAnnotationManager = {
        return navigationMapView?.mapView.annotations.makePointAnnotationManager()
    }()!
    
//    private var currentProgress: RouteProgress?
    
    lazy var endRouteView: UIView = {
        let h: CGFloat = 128
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 128))
        view.backgroundColor = UIColor.black
        let img = UIImage(named: "destinationMark")
        let imgView = UIImageView(image: img)
        let y = h / 2 - 18
        imgView.frame = CGRect(x: 33, y: y , width: 28, height: 35)
        view.addSubview(imgView)
        let label = UILabel(frame: CGRect(x: 76, y: y, width: 220, height: 35))
        label.text = "We have arrived!"
        label.textColor = .white
        view.addSubview(label)
        self.view.addSubview(view)
        return view
    }()
        
    // MARK: - UIViewController life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.showsSpeedLimits = false
        NavigationSettings.shared.distanceUnit = .kilometer
        navigationMapView?.mapView?.gestures.options.pitchEnabled = false

    }

}
