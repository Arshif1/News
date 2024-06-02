//
//  NewsListViewModel.swift
//  News
//
//  Created by Arshif on 01/06/2024.
//

import Foundation

class NewsListViewModel: ObservableObject {
    
    @Published var articles: [Article] = []
    
    var newsItems: [ArticleItem] {
        articles.map(transform)
    }
    
    private func transform(_ article: Article) -> ArticleItem {
        ArticleItem(id: UUID(), imageURL: article.imageURL, date: "aDate", title: "aTitle", description: article.description, publishedBy: "Published By: \(article.author)")
    }
    
    let articleLoader = ArticleLoader()
    
    init() {
        loadNews()
    }
    
    private func loadNews() {
        Task {
            guard let loadedArticles = try? await articleLoader.loadNews() else { return }
            await MainActor.run {
                self.articles = loadedArticles
            }
        }
    }
    
}
