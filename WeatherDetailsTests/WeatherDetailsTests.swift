//
//  WeatherDetailsTests.swift
//  WeatherDetails
//
//  Created by Rajneesh on 07/02/21.
//  Copyright © 2021 BRRV. All rights reserved.
//

import XCTest
@testable import WeatherDetails

class WeatherDetailsTests: XCTestCase {
    var apiManagerNew: APIManager!
    let sessionNew = MockURLSession()
    let mockLocation = MockLocation()
    
    override func setUp() {
        apiManagerNew = APIManager.sharedInstance
        apiManagerNew.session = sessionNew
        sessionNew.nextData = WeatherTestData.data
        WeatherDetailRequest.sharedInstance.locationManager = mockLocation
    }
    
    override func tearDown() {
        apiManagerNew = nil
    }
    
    
    func testTemperature() {
    
        let viewModel = WeatherDetailViewModel()
        viewModel.fetchWeatherDetails()
        
        let expectation = XCTestExpectation()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            
            XCTAssertEqual(viewModel.temperature, "120.32", "Failed to get temprature")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testCurrentCity() {
        let viewModel = WeatherDetailViewModel()
        viewModel.fetchWeatherDetails()
        
        let expectation = XCTestExpectation()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            
            XCTAssertEqual(viewModel.currentCity, "Europe/Stockholm", "Failed to get current city")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testTime() {
        let viewModel = WeatherDetailViewModel()
        viewModel.fetchWeatherDetails()
        
        let expectation = XCTestExpectation()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            
            XCTAssertEqual(viewModel.time, "Friday, February 5", "Time is not in specified format EEEE, MMMM d ")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5.0)
    }
    
}
