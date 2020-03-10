//
//  ViewController.swift
//  Better Wireframe
//
//  Created by Prashikh Agrawal  on 27/02/20.
//  Copyright © 2020 Prashikh Agrawal . All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate{
    
    @IBOutlet weak var mapView: MKMapView!
    fileprivate let locationManager = CLLocationManager()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print("reching 1")
        if CLLocationManager.locationServicesEnabled(){
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingHeading()
        }
        
        // Do any additional setup after loading the view.
        locationManager.requestWhenInUseAuthorization()
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.startUpdatingLocation()
        var locManager = CLLocationManager()
        locManager.requestWhenInUseAuthorization()
        var currentLocation: CLLocation!
        if
            CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
                CLLocationManager.authorizationStatus() == .authorizedAlways
        {
            currentLocation = locManager.location
        }
        let lat = currentLocation.coordinate.latitude
        let long = currentLocation.coordinate.longitude
        print("reaching 2")
        let viewRegion = MKCoordinateRegion(center: .init(latitude: lat, longitude: long), latitudinalMeters: 200, longitudinalMeters: 200)
        let region = MKCoordinateRegion(center: .init(latitude: lat, longitude: long), latitudinalMeters: 200, longitudinalMeters: 200)
        mapView.setRegion(region, animated: true)
        mapView.showsUserLocation = true
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else {return}
        print("locations = \(locValue.latitude) \(locValue.longitude)")
    }
}

