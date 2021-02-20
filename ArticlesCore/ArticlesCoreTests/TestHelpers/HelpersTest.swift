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

//func makeItemsJSON(_ items: [[String: Any]]) -> Data {
//    let json = ["items": items]
//    return try! JSONSerialization.data(withJSONObject: json)
//}

extension HTTPURLResponse {
    convenience init(statusCode: Int) {
        self.init(url: anyURL(), statusCode: statusCode, httpVersion: nil, headerFields: nil)!
    }
}
