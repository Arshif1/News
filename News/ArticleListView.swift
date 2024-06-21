//
//  ArticleListView.swift
//  News
//
//  Created by Arshif on 21/06/2024.
//

import Foundation
import SwiftUI

struct ArticleListView: View {
    
    @State var path = NavigationPath()
    let articles: [Article]
    
    var body: some View {
        NavigationStack(path: $path) {
            List(articles) { item in
                ArticleView(news: item, path: $path)
                    .padding(5)
                    .listRowInsets(.init())
                    .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationTitle("News")
            .navigationDestination(for: Article.self) { article in
                ArticleDetailView(newsitem: article)
            }
        }
    }
}
