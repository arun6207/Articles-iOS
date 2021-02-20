//
//  MostViewedViewModel.swift
//  ArticlesApp
//
//  Created by Arun Amuri on 20/02/2021.
//

import Foundation
import ArticlesCore

class MostViewedViewModel {
    
    private let service: RemoteMostViewedArticles
    var articles: [Article] = [Article]()
    
    init() {
        self.service = RemoteMostViewedArticles(url: APIManager.mostViewedURL(),
                                                client: URLSessionHTTPClient(session: URLSession.shared))
    }
    
    func article(with index: Int) -> Article {
        return articles[index]
    }
    
    func loadMostViewedArticles(handler: @escaping (Result<Bool, Error>) -> Void) {
        service.load { [weak self] (result) in
            switch result {
            case let .failure(error):
                print(error.localizedDescription)
                handler(.failure(error))
            case let .success(articles):
                self?.articles = articles
                handler(.success(true))
            }
        }
    }
}


