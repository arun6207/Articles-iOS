//
//  Article.swift
//  ArticlesCore
//
//  Created by Arun Amuri on 20/02/2021.
//

import Foundation

public struct Article: Codable {
    public let uri: String
    public let url: String
    public let id, assetID: Int
    public let source: String?
    public let publishedDate: String?
    public let updated: String?
    public let section: String?
    public let subsection: String?
    public let nytdsection: String?
    public let adxKeywords: String?
    public let column: String?
    public let byline: String?
    public let type: ResultType?
    public let title: String?
    public let abstract: String?
    public let desFacet: [String]?
    public let orgFacet: [String]?
    public let perFacet: [String]?
    public let geoFacet: [String]?
    public let media: [Media]?
    public let etaID: Int?
    
    enum CodingKeys: String, CodingKey {
        case uri, url, id
        case assetID = "asset_id"
        case source
        case publishedDate = "published_date"
        case updated, section, subsection, nytdsection
        case adxKeywords = "adx_keywords"
        case column, byline, type, title, abstract
        case desFacet = "des_facet"
        case orgFacet = "org_facet"
        case perFacet = "per_facet"
        case geoFacet = "geo_facet"
        case media
        case etaID = "eta_id"
    }
    
    public enum Source: String, Codable {
        case newYorkTimes = "New York Times"
    }
    
    public enum ResultType: String, Codable {
        case article = "Article"
    }
}

extension Article: Equatable {
    public static func == (lhs: Article, rhs: Article) -> Bool {
        return lhs.id == rhs.id
    }
}
