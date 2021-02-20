//
//  MostViewedArticlesMapperTest.swift
//  ArticlesCoreTests
//
//  Created by Arun Amuri on 20/02/2021.
//

import XCTest
import ArticlesCore

class MostViewedArticlesMapperTest: XCTestCase {
    
    func test_map_throwsErrorOnNon200HTTPResponse() throws {
        let json = makeArticlesJSON([])
        let samples = [199, 201, 300, 400, 500]
        
        try samples.forEach { code in
            XCTAssertThrowsError(
                try MostViewedArticlesMapper.map(json, from: HTTPURLResponse(statusCode: code))
            )
        }
    }
    
    func test_map_throwsErrorOn200HTTPResponseWithInvalidJSON() {
        let invalidJSON = Data("invalid json".utf8)
        XCTAssertThrowsError(
            try MostViewedArticlesMapper.map(invalidJSON, from: HTTPURLResponse(statusCode: 200))
        )
    }
    
    func test_map_deliversNoItemsOn200HTTPResponseWithEmptyJSONList() throws {
        let emptyListJSON = makeArticlesJSON([])
        let result = try MostViewedArticlesMapper.mostViewResult(emptyListJSON, from:  HTTPURLResponse(statusCode: 200))
        XCTAssert((result as Any) is MostViewed)
    }
    
    func test_map_deliversArticlesOn200HTTPResponseWithJSONList() throws {
        guard let articles = readLocalFile(forName: "mostViewed") else {
            return
        }
        let mostViewed = try MostViewedArticlesMapper.mostViewResult(articles, from:  HTTPURLResponse(statusCode: 200))
        XCTAssert((mostViewed as Any) is MostViewed)
        XCTAssertNotNil(mostViewed.results)
        XCTAssertEqual(mostViewed.results.count, 2)
    }
    
    private func readLocalFile(forName name: String) -> Data? {
        let testBundle = Bundle(for: type(of: self))
        
        guard
            let bundle = testBundle.path(forResource: name, ofType: "json"),
            let data = try? String(contentsOfFile: bundle).data(using: .utf8) else { return nil }
        return data
    }
}
