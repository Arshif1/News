//
//  Article.swift
//  News_Uikit
//
//  Created by Arshif on 23/06/2024.
//

import Foundation

struct Article: Decodable {
    
    let article_id: String
    let title: String?
    let pubDate: String
    let content: String?
    let image_url: String?
}

struct ArticleResults : Decodable {
    let results: [Article]
}
