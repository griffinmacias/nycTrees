//
//  ViewController.swift
//  nycTrees
//
//  Created by Mason Macias on 8/22/17.
//  Copyright © 2017 griffinmacias. All rights reserved.
//

import UIKit
import GoogleMaps
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let camera = GMSCameraPosition.camera(withLatitude: -33.868, longitude: 151.2086, zoom: 14)
        let mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        let marker = GMSMarker()
        marker.position = camera.target
        marker.snippet = "Hello World"
        marker.appearAnimation = kGMSMarkerAnimationPop
        marker.map = mapView
        view = mapView
//        Network.fetchAllTrees { (json, error) in
//            guard error == nil else { return }
//            if let json = json {
//                print(json)
//            }
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

