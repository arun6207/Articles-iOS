//
//  MostViewedCellViewModel.swift
//  ArticlesApp
//
//  Created by Arun Amuri on 20/02/2021.
//

import Foundation
import ArticlesCore

struct MostViewedCellViewModel {
    let article: Article
    
    var title: String {
        article.title ?? ""
    }
    
    var abstract: String {
        article.abstract ?? ""
    }
    
    var displayDate: String {
        article.publishedDate ?? ""
    }
    
    var byline: String {
        article.byline ?? ""
    }
}
