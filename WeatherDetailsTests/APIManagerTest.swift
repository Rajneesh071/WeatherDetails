//
//  CurrencyConverterTests.swift
//  CurrencyConverterTests
//
//  Created by Rajneesh on 07/02/21.
//  Copyright © 2021 BRRV. All rights reserved.
//

import XCTest
@testable import WeatherDetails

class APIManagerTest: XCTestCase {
    
    var apiManager: APIManager!
    let mockSession = MockURLSession()
    
    override func setUp() {
        super.setUp()
        apiManager = APIManager.sharedInstance
        apiManager.session = mockSession
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_get_resume_called() {
        
        let dataTask = MockURLSessionDataTask()
        mockSession.nextDataTask = dataTask
        
        guard let url = URL(string: "https://mockurl") else {
            fatalError("URL can't be empty")
        }
        
        apiManager.requestApi(apiUrl: url.absoluteString) { (data, res, err) in
        }
        
        XCTAssert(dataTask.resumeWasCalled)
    }
    
    func test_get_should_return_data() {
        let expectedData = "{}".data(using: .utf8)
        
        mockSession.nextData = expectedData
        
        var actualData: Data?
        apiManager.requestApi(apiUrl: "https://mockurl") { (data, res, errr) in
            actualData = data
        }
        
        XCTAssertNotNil(actualData)
    }
}

