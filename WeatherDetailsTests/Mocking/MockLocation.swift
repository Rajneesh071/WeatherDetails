//
//  MockLocation.swift
//  WeatherDetailsTests
//
//  Created by Rajneesh on 08/02/21.
//  Copyright © 2021 BRRV. All rights reserved.
//


import Foundation
import UIKit
import CoreLocation
@testable import WeatherDetails

class MockLocation: LocationManagerProtocol {
    func getLocation(completionn: @escaping MockLocation.LocationCompletion) {
        let coor = CLLocationCoordinate2D(latitude: 55.4444, longitude: 44.4444)
        completionn(coor)
    }
}

