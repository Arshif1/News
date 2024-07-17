//
//  NewsListViewModel.swift
//  News
//
//  Created by Arshif on 01/06/2024.
//

import Foundation

class NewsListViewModel: ObservableObject {
    
    private let articleLoader = ArticleLoader()
    
    @Published private var articles: [Article] = []
        
    var newsItems: [ArticleItem] {
        articles.map(transform)
    }
    
    init() {
        loadNews()
    }
    
    private func loadNews() {
        Task {
            guard let loadedArticles = try? await articleLoader.loadArticles() else { return }
            await MainActor.run {
                self.articles = loadedArticles
            }
        }
    }
    
    private func loadNews(searchText: String) {
        Task {
            guard let loadedArticles = try? await articleLoader.load(With: searchText) else { return }
            await MainActor.run {
                articles = loadedArticles
            }
        }
    }
    
    
    
    private func displayDate(from date: Date) -> String {
        let formatter = DateFormatter()
        let dateformat = "EEEE, d MMM yyyy"
        formatter.dateFormat = dateformat
        return formatter.string(from: date)
    }
        
    private func transform(_ article: Article) -> ArticleItem {
        ArticleItem(id: UUID(),
                    imageURL: article.imageURL,
                    date: displayDate(from: article.date),
                    title: article.title,
                    description: article.description,
                    content: article.content,
                    url: article.detailURL,
                    publishedBy: "Published By: \(article.author)")
    }
}
