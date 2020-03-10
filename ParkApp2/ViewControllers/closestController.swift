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


class closestController: UIViewController {
    
    let kGOOGLE_API_KEY = "API Google Key here"

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            // Do any additional setup after loading the view.
            locationManager.requestWhenInUseAuthorization()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.distanceFilter = kCLDistanceFilterNone
            locationManager.startUpdatingLocation()
            let location = locationManager.location
            let viewRegion = MKCoordinateRegion(center: .init(latitude: ((location?.coordinate.latitude)!), longitude: ((location?.coordinate.longitude)!)), latitudinalMeters: 200, longitudinalMeters: 200)
            mapView.setRegion(viewRegion, animated: true)
            mapView.showsUserLocation = true
        
        searchPlaceFromGoogle()

        //navigationController?.popViewController(animated: true)
        }
}

func searchPlaceFromGoogle(place: String = "Parking"){
    let URLSearchOne = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location="
    let location = locationManager.location
    let latitude = (location?.coordinate.latitude)!
    let longitude = (location?.coordinate.longitude)!
    var URLSearch = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=\(latitude),\(longitude)&radius=1600&type=parking&key=AIzaSyBSbce98wfAFHs08hfr-OYsza9SHAh4_HU"
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

