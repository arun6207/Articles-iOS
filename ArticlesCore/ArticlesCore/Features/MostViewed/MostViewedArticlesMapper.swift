//
//  MostViewedArticlesMapper.swift
//  ArticlesCore
//
//  Created by Arun Amuri on 20/02/2021.
//

import Foundation

public final class MostViewedArticlesMapper {
    
    public enum Error: Swift.Error {
        case invalidData
    }
    
    public static func map(_ data: Data, from response: HTTPURLResponse) throws -> [Article] {
        return try mostViewResult(data, from: response).results
    }
    
    public static func mostViewResult(_ data: Data, from response: HTTPURLResponse) throws -> MostViewed {
        guard response.isOK, let root = try? JSONDecoder().decode(MostViewed.self, from: data) else {
            throw Error.invalidData
        }
        return root
    }
}
