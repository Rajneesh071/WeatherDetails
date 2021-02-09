//
//  WeatherModel.swift
//  WeatherDetails
//
//  Created by Rajneesh on 07/02/21.
//  Copyright © 2021 BRRV. All rights reserved.
//

import Foundation

// MARK: - WeatherModel
struct WeatherModel: Codable {
    let latitude, longitude: Double?
    let timezone: String?
    let currently: Currently?
}

// MARK: - Currently
struct Currently: Codable {
    let time: Int?
    let temperature, apparentTemperature: Double?
    let humidity, pressure, windSpeed: Double?
    let windBearing: Int?
    let cloudCover: Double?
    let visibility: Double?
}
