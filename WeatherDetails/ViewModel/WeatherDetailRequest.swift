//
//  WeatherDetailRequest.swift
//  WeatherDetails
//
//  Created by Rajneesh on 09/02/21.
//  Copyright © 2021 BRRV. All rights reserved.
//

import Foundation

protocol WeatherDetailRequestProrocol {
    func getWeatherDetails (
    success: @escaping (WeatherModel?) -> Void,
    failure: @escaping (ErrorResponse?) -> Void)
}

class WeatherDetailRequest : WeatherDetailRequestProrocol {
    static let sharedInstance: WeatherDetailRequest = WeatherDetailRequest()
    
    var locationManager : LocationManagerProtocol!
    
    private init() {
        self.locationManager = LocationManager.sharedInstance
    }
    
    private var apiUrl: String = "https://api.darksky.net/forecast/2bb07c3bece89caf533ac9a5d23d8417/"
    
    func getWeatherDetails (
        success: @escaping (WeatherModel?) -> Void,
        failure: @escaping (ErrorResponse?) -> Void) {
        
        locationManager.getLocation { [weak self] location in
            guard let self = self else {
                return
            }
            let latLong = String(location.latitude) + "," + String(location.longitude)
            let url = "\(self.apiUrl)\(latLong)"
            
            APIManager.sharedInstance.requestApi(
                apiUrl: url,
                handler: {data, response, error in
                    if let data = data {
                        do {
                            let response = try JSONDecoder()
                                .decode(WeatherModel.self, from: data)
                            success(response)
                        } catch let error {
                            print(error)
                            failure(ErrorResponse(code: -1, info: "Something went wrong"))
                        }
                    }
            })
        }}
}
