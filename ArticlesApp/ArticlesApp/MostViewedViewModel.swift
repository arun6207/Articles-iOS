//
//  MostViewedViewModel.swift
//  ArticlesApp
//
//  Created by Arun Amuri on 20/02/2021.
//

import Foundation
import ArticlesCore

class MostViewedViewModel {
    
    typealias feedResult = Result<[Article], Error>
    
    let service: RemoteMostViewedArticles
    var articles: [Article] = [Article]()
    
    init() {
        self.service = RemoteMostViewedArticles(url: APIManager.mostViewedURL(),
                                                client: URLSessionHTTPClient(session: URLSession.shared))
    }
    
    func loadMostViewedArticles(handler: @escaping (feedResult) -> Void) {
        service.load { [weak self] (result) in
            switch result {
            case let .failure(error):
                print(error.localizedDescription)
            case let .success(articles):
                self?.articles = articles
            }
        }
    }
    
}



