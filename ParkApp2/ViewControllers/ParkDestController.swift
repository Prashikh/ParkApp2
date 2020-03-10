//
//  ParkatDestinationViewController.swift
//  Better Wireframe
//
//  Created by Prashikh Agrawal  on 28/02/20.
//  Copyright © 2020 Prashikh Agrawal . All rights reserved.
//

import UIKit
import MapKit

class ParkatDestViewController: UIViewController, UISearchBarDelegate {

    fileprivate let locationManager:CLLocationManager = CLLocationManager()
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.startUpdatingLocation()
        let location = locationManager.location
        let viewRegion = MKCoordinateRegion(center: .init(latitude: ((location?.coordinate.latitude)!), longitude: ((location?.coordinate.longitude)!)), latitudinalMeters: 200, longitudinalMeters: 200)
        mapView.setRegion(viewRegion, animated: true)
        mapView.showsUserLocation = true
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("this is your term: ", searchText)
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
    }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.endEditing(true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.endEditing(true)
    }

}
