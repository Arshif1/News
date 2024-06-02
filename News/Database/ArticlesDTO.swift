//
//  ArticlesDTO.swift
//  News
//
//  Created by Arshif on 01/06/2024.
//

import Foundation

struct ArticlesDTO: Decodable {
    
    struct ArticleDTO: Decodable {
        let author: String?
    }
    
    let status: String
    let articles: [ArticleDTO]
}
