//
//  MostViewed.swift
//  ArticlesCore
//
//  Created by Arun Amuri on 20/02/2021.
//

import Foundation

public struct MostViewed: Decodable, Equatable {
    public let status, copyright: String
    public let numResults: Int
    public let results: [Article]
    
    public enum CodingKeys: String, CodingKey {
        case status, copyright
        case numResults = "num_results"
        case results
    }
}
