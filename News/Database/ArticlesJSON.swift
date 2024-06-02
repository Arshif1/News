//
//  ArticlesDTO.swift
//  News
//
//  Created by Arshif on 01/06/2024.
//

import Foundation

struct ArticlesJSON: Decodable {
    
    struct ArticleJSON: Decodable {
        let author: String?
    }
    
    let status: String
    let articles: [ArticleJSON]
}
