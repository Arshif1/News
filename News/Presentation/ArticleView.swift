//
//  ArticleView.swift
//  News
//
//  Created by Arshif on 30/05/2024.
//

import Foundation
import SwiftUI

struct ArticleView: View {
    
    let article: ArticleItem
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            AsyncImage(url: article.imageURL, content: { image in
                image.resizable()
            }, placeholder: {
                ProgressView()
            }).frame(height: 200)
            Text(article.date)
                .foregroundStyle(Color.dateColor)
                .font(.system(size: 10, weight: .light, design: .serif))
            Text(article.title)
                .foregroundStyle(Color.titleColor)
                .font(.system(size: 14, weight: .semibold, design: .serif))
            Text(article.description)
                .foregroundStyle(Color.black)
                .font(.system(size: 12, weight: .light, design: .serif))
            Text(article.publishedBy)
                .foregroundStyle(Color.dateColor)
                .font(.system(size: 10, weight: .semibold, design: .serif))
        }
    }
}
