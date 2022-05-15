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

final class CustomNavigationVC: NavigationViewController{

    // MARK: - Constatns
    let xTrailing: CGFloat = 12
    
    // MARK: - Properties
//    weak var endRouteDelegate: TurnByTurnNavigationVCDelegate?
    var topBannerVC: TopBannerViewController!
    
    // MARK: Internal properties
//    private var resumeButton: UserLocationButton!
    private var cancellable: AnyCancellable?
        
    internal lazy var pointAnnotationManager: PointAnnotationManager = {
        return navigationMapView?.mapView.annotations.makePointAnnotationManager()
    }()!
    
    private var currentProgress: RouteProgress?
    
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
//        setupResumeButton()
                
//        self.delegate = self
        
//        NotificationCenter.default.addObserver(self,
//                                               selector: #selector(navigationCameraStateDidChange(_:)),
//                                               name: .navigationCameraStateDidChange,
//                                               object: navigationMapView!.navigationCamera)
        // #273 - suggested by Ochi
        NavigationSettings.shared.distanceUnit = .kilometer
        navigationMapView?.mapView?.gestures.options.pitchEnabled = false

    }
            
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
/*
    private func setupResumeButton() {
        let userLocationButton = UserLocationButton(buttonSize: (Images.locationImage?.size.width)!)
        userLocationButton.addTarget(self, action: #selector(resumeButtonTapped), for: .touchUpInside)
        
        userLocationButton.translatesAutoresizingMaskIntoConstraints = false
        navigationMapView?.mapView.addSubview(userLocationButton)
        
        self.resumeButton = userLocationButton
        userLocationButton.isHidden = true // hide it by default
        
        // setup autolayout
        userLocationButton.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().offset(-xTrailing)
//            make.bottom.equalTo(self.feedbackButton.snp.top).offset(-10)
            make.bottom.equalTo(self.navigationMapView!.snp.bottom).offset(-(110+UIApplication.bottomSafeAreaHeight))
            make.height.equalTo(48)
            make.width.equalTo(48)
        }
    }
*/
//    @objc private func resumeButtonTapped() {
//        navigationMapView?.navigationCamera.follow()
//    }
    
//    @objc func feedbackIssue(){
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        if let vc = storyboard.instantiateViewController(withIdentifier: "RatingVC") as? RatingVC {
//            vc.modalPresentationStyle = .formSheet
//            self.present(vc, animated: true, completion: nil)
//        }
//    }
}

//extension CustomNavigationVC: NavigationViewControllerDelegate {
//
//    func navigationViewController(_ navigationViewController: NavigationViewController, didAdd finalDestinationAnnotation: PointAnnotation, pointAnnotationManager: PointAnnotationManager){
//
//        let point = finalDestinationAnnotation.point
//            var destinationAnnotation = PointAnnotation(coordinate: point.coordinates)
//            destinationAnnotation.image = .init(image: UIImage(named: "destinationMark")!, name: "navigationDest")
//        navigationViewController.navigationMapView!.pointAnnotationManager?.annotations = [destinationAnnotation]
//
//        }
//
////    func navigationViewController(_ navigationViewController: NavigationViewController, didUpdate progress: RouteProgress, with location: CLLocation, rawLocation: CLLocation) {
////    }
//
//    func navigationViewController(_ navigationViewController: NavigationViewController, didArriveAt waypoint: Waypoint) -> Bool {
//
//        if navigationViewController.navigationService.routeProgress.isFinalLeg {
//            // end
//            endRoute()
//            return false
//        }
//        return true
//    }
//
//    func navigationViewControllerDidDismiss(_ navigationViewController: NavigationViewController, byCanceling canceled: Bool) {
//        self.dismiss(animated: true, completion: nil)
////        navigationService.stop()
////        feedbackIssue()
//    }
//
////    func navigationViewController(_ navigationViewController: NavigationViewController, didRerouteAlong route: Route) {
////    }
////
////    func navigationViewController(_ navigationViewController: NavigationViewController, shouldRerouteFrom location: CLLocation) -> Bool{
////
////         #if DEMO
////
////            if(DemoSession.shared.isDemoRoute)
////           {
////               return false
////           }
////            else{
////                return true
////            }
////
////        #else
////        return true
////        #endif
////    }
//
//    func endRoute(fromUser: Bool = false) {
//
//        if !fromUser { // since if user end the Trip data updated already so that we don't need to update from here
//
//            // we don't need to show this when user end the route
//            // show endRouteView
//            let offset: CGFloat = 128
//            UIView.animate(withDuration: 0.2) {
//                self.endRouteView.frame = CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.width, height: offset)
//            } completion: { _ in
//                // TODO: Dismiss in a few seconds?
//            }
//        }
//    }
//}

// NavigationMapViewCourseTrackingDelegate was removed from beta.5
//extension CustomNavigationVC {
//
//    @objc func navigationCameraStateDidChange(_ notification: Notification) {
//        guard let navigationCameraState = notification.userInfo?[NavigationCamera.NotificationUserInfoKey.state] as? NavigationCameraState else { return }
//
//        switch navigationCameraState {
//        case .transitionToFollowing, .following:
////            resumeButton?.isHidden = true
//            break
//        case .idle, .transitionToOverview, .overview:
////            resumeButton?.isHidden = false
//            break
//        }
//    }
//}

//extension CustomNavigationVC: NavigationViewDelegate {
//    func navigationView(_ view: NavigationView, didTapCancelButton: CancelButton) {
//        
//    }
//}

