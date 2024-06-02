//
//  NewsCell.swift
//  News
//
//  Created by Arshif on 30/05/2024.
//

import Foundation
import SwiftUI

struct NewsCell: View {
    
    let height: CGFloat
    let news: ArticleItem
    
    var body: some View {
        NavigationStack {
            NavigationLink {
                navigationDestination
                    .navigationTitle("Detail")
            } label: {
                content
            }
        }
    }
    
    private var content: some View {
        VStack(alignment: .leading, spacing: 5) {
            Color.red
                .frame(height: height)
            Text(news.date)
                .foregroundStyle(Color.dateColor)
                .font(.system(size: 10, weight: .light, design: .serif))
            Text(news.title)
                .foregroundStyle(Color.titleColor)
                .font(.system(size: 14, weight: .semibold, design: .serif))
            Text(news.description)
                .foregroundStyle(Color.black)
                .font(.system(size: 12, weight: .light, design: .serif))
            Text(news.publishedBy)
                .foregroundStyle(Color.dateColor)
                .font(.system(size: 10, weight: .semibold, design: .serif))
        }
    }
    
    private var navigationDestination: some View {
        ArticleDetailView(item: ArticleDetailItem(date: news.date,
                                                  title: news.title,
                                                  publishedBy: news.publishedBy,
                                                  content: news.description))
    }
}
