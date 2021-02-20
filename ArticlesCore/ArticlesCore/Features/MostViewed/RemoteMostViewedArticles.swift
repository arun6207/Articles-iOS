//
//  RemoteMostViewedArticles.swift
//  ArticlesCore
//
//  Created by Arun Amuri on 20/02/2021.
//

import Foundation

public protocol MostViewedArticlesLoader {
    typealias Result = Swift.Result<[Article], Error>
    func load(completion: @escaping (Result) -> Void)
}

public final class RemoteMostViewedArticles: MostViewedArticlesLoader {
    private let url: URL
    private let client: HTTPClient
    
    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }
    
    public init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    
    public func load(completion: @escaping (MostViewedArticlesLoader.Result) -> Void) {
        client.get(from: url) { (result) in
            switch result {
            case let .success((data,response)):
                var mostViewedArticles = [Article]()
                do {
                    mostViewedArticles = try  MostViewedArticlesMapper.map(data, from: response)
                    completion(.success(mostViewedArticles))
                } catch{
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
