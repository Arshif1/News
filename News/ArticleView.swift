//
//  ArticleCell.swift
//  News
//
//  Created by Arshif on 20/06/2024.
//

import SwiftUI

struct ArticleView: View {
    let news: Article
    
    var body: some View {
        HStack(spacing: 15) {
            Color.red
                .frame(width: 137, height: 140)
            cellWrittenContent
        }
    }
    
    var cellWrittenContent: some View {
        VStack(alignment: .leading, spacing: 5) {
            
            Text(news.title)
                .foregroundColor(.primaryTextColor)
                .font(.boldHeader2)
                .lineLimit(3)
            
            Text(news.author ?? "")
                .foregroundColor(.greyTextColor)
                .font(.mediumHeader2)
                .padding(.vertical, 10)
            
            HStack(spacing: 10) {
                Text(news.category)
                    .foregroundColor(.highlightTextColor)
                    .font(.boldHeader3)
                Text(news.publishedAt)
                    .foregroundColor(.greyTextColor)
                    .font(.mediumHeader2)
            }
        }
        .frame(maxWidth: .infinity)
    }

}

#Preview {
    ArticleView(news: Article(title: "Monarch population soars 4,900 percent since last year in thrilling 2021 western migration", author: "By Andy Corbley", publishedAt: "5m ago", category: "Entertainment", content: "cshbjacbjhscjhws bcjbsj`ckjs"))
}
  


