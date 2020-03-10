//
//  ViewController.swift
//  Better Wireframe
//
//  Created by Prashikh Agrawal  on 27/02/20.
//  Copyright © 2020 Prashikh Agrawal . All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    fileprivate let locationManager:CLLocationManager = CLLocationManager()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.startUpdatingLocation()
        let location = locationManager.location
        let lat = location?.coordinate.latitude
        let long = location?.coordinate.longitude
//        let viewRegion = MKCoordinateRegion(center: .init(latitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!), latitudinalMeters: 200, longitudinalMeters: 200)
        let region = MKCoordinateRegion(center: .init(latitude: lat!, longitude: long!), latitudinalMeters: 200, longitudinalMeters: 200)
        mapView.setRegion(region, animated: true)
        mapView.showsUserLocation = true
        
    }
}

