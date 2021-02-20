//
//  APIManagerTests.swift
//  ArticlesAppTests
//
//  Created by Arun Amuri on 20/02/2021.
//

import XCTest
@testable import ArticlesApp

class APIManagerTests: XCTestCase {
    
    override func setUp() {
        APIManager.baseURL = URL(string: "https://a-url.com")!
    }
    
    
    func test_mostViewedURLWithValidQueryParams() {
        let request = APIManager.mostViewedURL()
        XCTAssertEqual(request.scheme, "https", "scheme")
        XCTAssertEqual(request.host, "a-url.com", "host")
        XCTAssertEqual(request.path, "/mostpopular/v2/viewed/7.json", "path")
        XCTAssertNotNil(request.query)
    }
}
