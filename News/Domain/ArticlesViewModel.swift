//
//  ArticlesViewModel.swift
//  News
//
//  Created by Arshif on 25/06/2024.
//

import Foundation

class ArticlesViewModel: ObservableObject {
    
    @Published var articles: [Article] = []
    private let urlString = "https://newsdata.io/api/1/latest?apikey=pub_457050f3022a220f2fee7f26b7bedf2ce8912&q=pegasus&language=en"
    
    init() {
        loadArticle()
    }
    
    
    func fetchArticle() async throws -> [Article] {
        try await Task.sleep(nanoseconds: 3_000_000_000)
        guard let url = URL(string: urlString) else { return [] }
        let (data, _) = try await URLSession.shared.data(from: url)
        let json = try JSONDecoder().decode(ArticleResults.self, from: data)
        let articles: [Article] = json.results.compactMap(transform)
        return articles
    }
    
    func loadArticle() {
        
        Task {
            let articles = try await fetchArticle()
            await MainActor.run {
                self.articles = articles
            }
        }
    }
    
    func transform(_ jsonArticle: ArticleJson) -> Article? {
        guard let title = jsonArticle.title,
              let image_url = jsonArticle.image_url,
              let creator = jsonArticle.creator,
              let content = jsonArticle.content else { return nil }
        let article = Article(title: title, author: creator[0], publishedAt: jsonArticle.pubDate, category: jsonArticle.category[0], content: content)
        return article
    }
}
