//
//  ArticlesDTO.swift
//  News
//
//  Created by Arshif on 01/06/2024.
//

import Foundation

struct ArticlesJSON: Decodable {
    
    struct ArticleJSON: Decodable {
        let title: String
        let author: String?
        let description: String?
        let publishedAt: String
        let urlToImage: URL?
        let content: String
    }
    
    let status: String
    let articles: [ArticleJSON]
}
