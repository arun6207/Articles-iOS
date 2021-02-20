//
//  MostViewedCellViewModelTests.swift
//  ArticlesAppTests
//
//  Created by Arun Amuri on 20/02/2021.
//

import XCTest
import ArticlesCore
@testable import ArticlesApp


class MostViewedCellViewModelTests: XCTestCase {
    
    func test_mostViewedCellViewModel() {
        let viewmodel = MostViewedCellViewModel(article: stubArticles()[0])
        XCTAssertEqual(viewmodel.title, "Ted Cruz’s Cancún Trip: Family Texts Detail His Political Blunder")
        XCTAssertEqual(viewmodel.abstract, "The Texas senator faced fierce blowback for fleeing his state as a disaster unfolded. Text messages sent by his wife revealed a hastily planned trip away from their “FREEZING” family home.")
        XCTAssertEqual(viewmodel.byline, "By Shane Goldmacher and Nicholas Fandos")
        XCTAssertEqual(viewmodel.displayDate, "2021-02-18")
    }

    func test_map_deliversArticlesOn200HTTPResponseWithJSONList() throws {
        guard let articles = readLocalFile(forName: "mostViewed") else {
            return
        }
        let mostViewed = try MostViewedArticlesMapper.mostViewResult(articles, from: HTTPURLResponse())
        XCTAssert((mostViewed as Any) is MostViewed)
        XCTAssertNotNil(mostViewed.results)
        XCTAssertEqual(mostViewed.results.count, 2)
    }
    
    private func stubArticles()  -> [Article] {
        guard let articles = readLocalFile(forName: "mostviewed") else {
            return  [Article]()
        }
        do {
            return try MostViewedArticlesMapper.map(articles, from: HTTPURLResponse())
        } catch {
            return [Article]()
        }
    }
    
    private func readLocalFile(forName name: String) -> Data? {
        let testBundle = Bundle(for: type(of: self))
        
        guard
            let bundle = testBundle.path(forResource: name, ofType: "json"),
            let data = try? String(contentsOfFile: bundle).data(using: .utf8) else { return nil }
        return data
    }
}
