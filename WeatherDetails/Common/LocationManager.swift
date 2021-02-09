//
//  LocationManager.swift
//  WeatherDetails
//
//  Created by Rajneesh on 07/02/21.
//  Copyright © 2021 BRRV. All rights reserved.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate, LocationManagerProtocol {
    static let sharedInstance: LocationManager = LocationManager()
    
    var locationCoordinate : CLLocationCoordinate2D?
    private var locationManager: CLLocationManager
    
    typealias LocationCompletion = (CLLocationCoordinate2D) -> Void
    var completion : LocationCompletion?
    
    private override init() {
        locationManager = CLLocationManager()
        super.init()

        if (CLLocationManager.locationServicesEnabled()) {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
        }
    }
    
    // MARK: - CLLocationManagerDelegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last! as CLLocation
        locationCoordinate = location.coordinate
        
        if locationCoordinate != nil {
            completion!(locationCoordinate!)
        }
        
        //Stop getting location just after receiving it.
        locationManager.stopUpdatingLocation()
    }
    
    func getLocation(completionn:@escaping LocationCompletion) {
        locationManager.startUpdatingLocation()
        completion = completionn
    }
}

protocol LocationManagerProtocol {
    typealias LocationCompletion = (CLLocationCoordinate2D) -> Void
    func getLocation(completionn:@escaping LocationCompletion)
}
