//
//  closestController.swift
//  Better Wireframe
//
//  Created by Prashikh Agrawal  on 28/02/20.
//  Copyright © 2020 Prashikh Agrawal . All rights reserved.
//
// Google Maps API Key : AIzaSyBSbce98wfAFHs08hfr-OYsza9SHAh4_HU

import UIKit
import MapKit
fileprivate let locationManager:CLLocationManager = CLLocationManager()

var latitude: Double!
var longitude: Double!

class closestController: UIViewController {
    

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
                
        let region = MKCoordinateRegion(center: .init(latitude: lat, longitude: long), latitudinalMeters: 200, longitudinalMeters: 200)
        mapView.setRegion(region, animated: true)
        mapView.showsUserLocation = true
            mapView.showsUserLocation = true
        
        searchPlaceFromGoogle()

        //navigationController?.popViewController(animated: true)
        }
    
    func searchPlaceFromGoogle(place: String = "Parking"){
        var locManager = CLLocationManager()
        locManager.requestWhenInUseAuthorization()
        var currentLocation: CLLocation!
        if
            CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
                CLLocationManager.authorizationStatus() == .authorizedAlways
        {
            currentLocation = locManager.location
        }
        
        var URLSearch = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=\(currentLocation.coordinate.latitude),\(currentLocation.coordinate.longitude)&radius=1600&type=parking&key=AIzaSyBSbce98wfAFHs08hfr-OYsza9SHAh4_HU"
        URLSearch = URLSearch.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        var URLQuery = URLRequest(url: URL(string : URLSearch)!)
       
        URLQuery.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: URLQuery) { (data, response , error) in
            if(error == nil){
                let jsonDict = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                print(jsonDict as Any)
            }
            else{
                print("ERROR!\(String(describing: error))")
            }
        }
        task.resume()
        
        print(URLSearch)
    }
    
}
