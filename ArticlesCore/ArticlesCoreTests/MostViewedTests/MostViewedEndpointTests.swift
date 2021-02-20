//
//  MostViewedEndpoint.swift
//  ArticlesCoreTests
//
//  Created by Arun Amuri on 20/02/2021.
//

import XCTest
import ArticlesCore

class MostViewedEndpointTests: XCTestCase {
    func test_mostViwed_endpointURL() {
        let baseURL = URL(string: "https://api.nytimes.com/svc")!
        let received = MostViewedEndpoint.get(timePeriod: 7).url(baseURL: baseURL)
        XCTAssertEqual(received.scheme, "https", "scheme")
        XCTAssertEqual(received.host, "api.nytimes.com", "host")
        XCTAssertEqual(received.path, "/svc/mostpopular/v2/viewed/7.json", "path")
    }
}
