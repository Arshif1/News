//
//  Article.swift
//  News
//
//  Created by Arshif on 20/06/2024.
//

import Foundation

struct Article: Decodable {
    let title: String
    let author: String
    let publishedAt: String
    let category: String
    let content: String
}
