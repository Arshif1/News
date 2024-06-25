//
//  ArticleJson.swift
//  News
//
//  Created by Arshif on 25/06/2024.
//

import Foundation

struct ArticleJson: Decodable {
    
    let article_id: String
    let title: String?
    let pubDate: String
    let content: String?
    let image_url: String?
    let creator: [String]?
    let category: [String]
}

struct ArticleResults : Decodable {
    let results: [ArticleJson]
}
