//
//  MostViewedEndPoint.swift
//  ArticlesCore
//
//  Created by Arun Amuri on 20/02/2021.
//

import Foundation


public enum MostViewedEndpoint {
    
    /// get mostviewed artciles url
    /// - value1: time period
    /// - value2: last artcile to do pagination
    case get(timePeriod: Int, article: Article? = nil)
    
    public func url(baseURL: URL) -> URL {
        switch self {
        case let .get(time, _):
            var components = URLComponents()
            components.scheme = baseURL.scheme
            components.host = baseURL.host
            components.path = baseURL.path + "/mostpopular/v2/viewed/\(time).json"
            return components.url!
        }
    }
}
