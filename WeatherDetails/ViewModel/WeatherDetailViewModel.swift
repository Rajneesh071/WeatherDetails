//
//  WeatherDetailViewModel.swift
//  WeatherDetails
//
//  Created by Rajneesh on 07/02/21.
//  Copyright © 2021 BRRV. All rights reserved.
//

import Foundation

class WeatherDetailViewModel : ObservableObject {
    @Published var currentCity: String = ""
    @Published var temperature: String = ""
    @Published var windSpeed: String = ""
    @Published var time: String = "--"
    
    func fetchWeatherDetails() {
        
        WeatherDetailRequest.sharedInstance.getWeatherDetails(success: { [weak self] result in
            guard let self = self else {
                return
            }
            DispatchQueue.main.async {
                if let temp = result?.currently?.temperature {
                    self.temperature = String(temp)
                }
                if let city = result?.timezone {
                    self.currentCity = city
                }
                if let windSpeed = result?.currently?.windSpeed {
                    self.windSpeed = String(windSpeed)
                }
                if let time = result?.currently?.time {
                    let today = Date(timeIntervalSince1970: TimeInterval(time))
                    let formatter = DateFormatter()
                    formatter.dateFormat = "EEEE, MMMM d"
                    self.time = formatter.string(from: today)
                }
            }
        }) { error in
            
        }
        
    }
}


