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
    
    func displayDate(from date: Date) -> String {
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
                    publishedBy: "Published By: \(article.author)")
    }
    
    let articleLoader = ArticleLoader()
    
    init() {
        loadNews()
    }
    
    private func loadNews() {
        Task {
            do {
                let loadedArticles = try await articleLoader.loadNews()
                await MainActor.run {
                    self.articles = loadedArticles
                }
            } catch {
                print(error)
            }
        }
    }
    
}
