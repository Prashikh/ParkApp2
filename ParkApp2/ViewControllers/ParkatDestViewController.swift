//
//  ParkatDestinationViewController.swift
//  Better Wireframe
//
//  Created by Prashikh Agrawal  on 28/02/20.
//  Copyright © 2020 Prashikh Agrawal . All rights reserved.
//

import UIKit
import MapKit

class ParkatDestViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    fileprivate let locationManager:CLLocationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.startUpdatingLocation()
        let location = locationManager.location
        let viewRegion = MKCoordinateRegion(center: .init(latitude: ((location?.coordinate.latitude)!), longitude: ((location?.coordinate.longitude)!)), latitudinalMeters: 200, longitudinalMeters: 200)
        mapView.setRegion(viewRegion, animated: true)
        mapView.showsUserLocation = true

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
