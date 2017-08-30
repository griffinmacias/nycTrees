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
    var camera: GMSCameraPosition?
    var mapView: GMSMapView?
    override func viewDidLoad() {
        super.viewDidLoad()
        createCamera()
        createMapView()
        getAllTrees()
    }
    
    func getAllTrees() {
        Network.fetchAllTrees { (trees, error) in
            guard error == nil else { return }
            if let trees = trees as? [Tree] {
                DispatchQueue.main.async {
                    self.createMapMarkers(trees: trees)
                }
            }
        }
    }
    
    func createCamera() {
        camera = GMSCameraPosition.camera(withLatitude: 40.706099, longitude: -73.938396, zoom: 10)
    }
    
    func createMapView() {
        if let camera = self.camera {
            mapView = GMSMapView.map(withFrame: .zero, camera: camera)
            view = mapView
        }
    }
    
    func createMapMarkers(trees: [Tree]) {
        if let mapView = self.mapView {
            for tree in trees {
                let marker = GMSMarker()
                marker.position = CLLocationCoordinate2DMake(tree.latitude, tree.longitude)
                marker.snippet = tree.name
                marker.appearAnimation = kGMSMarkerAnimationPop
                marker.map = mapView
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

