//
//  WeatherTestData.swift
//  WeatherDetails
//
//  Created by Rajneesh on 07/02/21.
//  Copyright © 2021 BRRV. All rights reserved.
//

import Foundation
@testable import WeatherDetails

struct WeatherTestData {
    static let story: WeatherModel = {
        let url = Bundle.main.url(forResource: "WeatherTestData", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        return try! decoder.decode(WeatherModel.self, from: data)
    }()
    
    static let data: Data = {
        let url = Bundle.main.url(forResource: "WeatherTestData", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        return data
    }()
}
