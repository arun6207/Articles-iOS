//
//  Media.swift
//  ArticlesCore
//
//  Created by Arun Amuri on 20/02/2021.
//

import Foundation

// MARK: - Media

public struct Media: Codable {
    
    public enum Subtype: String, Codable {
        case photo = "photo"
    }
    
    public enum MediaType: String, Codable {
        case image = "image"
    }
    
    public let type: MediaType?
    public let subtype: Subtype?
    public let caption, copyright: String?
    public let approvedForSyndication: Int?
    public let mediaMetadata: [MediaMetaData]?
    
    enum CodingKeys: String, CodingKey {
        case type, subtype, caption, copyright
        case approvedForSyndication = "approved_for_syndication"
        case mediaMetadata = "media-metadata"
    }
}

// MARK: - MediaMetaData
public struct MediaMetaData: Codable {
    public let url: String?
    public let format: Format?
    public let height, width: Int?
    
    public enum Format: String, Codable {
        case mediumThreeByTwo210 = "mediumThreeByTwo210"
        case mediumThreeByTwo440 = "mediumThreeByTwo440"
        case standardThumbnail = "Standard Thumbnail"
    }
}
