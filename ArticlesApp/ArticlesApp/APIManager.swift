//
//  NetworkBuildable.swift
//  ArticlesApp
//
//  Created by Arun Amuri on 20/02/2021.
//

import Foundation
import ArticlesCore

private let BaseURL = "https://api.nytimes.com/svc"
private let apiKey = "1Mxg0XhUFR18epoTTU6TyCrRrtAAJjU9"


struct APIManager {
    static var baseURL: URL = URL(string: BaseURL)!
    
    private  static func appendApiKeyAsQueryParams(url: URL) -> URL {
        return url.appending("api-key",value: apiKey)
    }
    
    static func mostViewedURL(for days: Int = 7) -> URL {
        return appendApiKeyAsQueryParams(url: MostViewedEndpoint.get(timePeriod: days).url(baseURL: baseURL))
    }
}
