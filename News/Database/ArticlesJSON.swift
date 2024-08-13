//
//  ArticlesDTO.swift
//  News
//
//  Created by Arshif on 01/06/2024.
//

import Foundation

struct ArticlesJSON: Decodable {
    
    struct ArticleJSON: Decodable {
        let article_id: String
        let title: String
        let link: URL?
        let content: String
        let creator: [String]?
        let description: String?
        let pubDate: String
        let image_url: URL?
    }
    
    let status: String
    let results: [ArticleJSON]
    let nextPage: String?
}
