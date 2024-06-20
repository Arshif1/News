//
//  NewsArticle.swift
//  News_Uikit
//
//  Created by Arshif on 20/06/2024.
//

import Foundation
struct NewsArticle: Decodable {
    let title: String
    let author: String?
    let publishedAt: String
    let content: String?
}
