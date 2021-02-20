//
//  HelpersTest.swift
//  ArticlesCoreTests
//
//  Created by Arun Amuri on 20/02/2021.
//

import Foundation

func anyNSError() -> NSError {
    return NSError(domain: "error", code: 0)
}

func anyURL() -> URL {
    return URL(string: "http://url.com")!
}

func anyData() -> Data {
    return Data("sample data".utf8)
}

func makeArticlesJSON(_ items: [[String: Any]]) -> Data {
    let json = ["results": items,
                "status": "20",
                "num_results": 0,
                "copyright": "NewYork times"] as [String : Any]
    return try! JSONSerialization.data(withJSONObject: json)
}

extension HTTPURLResponse {
    convenience init(statusCode: Int) {
        self.init(url: anyURL(), statusCode: statusCode, httpVersion: nil, headerFields: nil)!
    }
}


//public let status, copyright: String
//public let numResults: Int
//public let results: [Article]
//
//public enum CodingKeys: String, CodingKey {
//    case status, copyright
//    case numResults = "num_results"
//    case results
//}
