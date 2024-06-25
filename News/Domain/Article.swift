//
//  Article.swift
//  News
//
//  Created by Arshif on 25/06/2024.
//

import Foundation

struct Article: Hashable, Identifiable {
    var id = UUID()
    
    let title: String
    let author: String
    let publishedAt: String
    let category: String
    let content: String
}
