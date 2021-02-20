//
//  MostViewedDataMapper.swift
//  ArticlesCore
//
//  Created by Arun Amuri on 20/02/2021.
//

import Foundation

public final class MostViewedDataMapper {
    public enum Error: Swift.Error {
        case invalidData
    }
    
    public static func map(_ data: Data, from response: HTTPURLResponse) throws -> Data {
        guard response.isOK, !data.isEmpty else {
            throw Error.invalidData
        }
        
        return data
    }
}
