//
//  ArticlesViewModel.swift
//  News_Uikit
//
//  Created by Arshif on 23/06/2024.
//

import Foundation
class ArticlesViewModel {
    
    var onLoadArticles: (([Article]) -> ())?
    var shouldShowActivityIndicator: ((Bool) -> Void)?
    private let urlString = "https://newsdata.io/api/1/latest?apikey=pub_457050f3022a220f2fee7f26b7bedf2ce8912&q=pegasus&language=en"
    
    func fetchArticle() async throws -> [Article] {
        guard let url = URL(string: urlString) else { return [] }
        let (data, _) = try await URLSession.shared.data(from: url)
        let json = try JSONDecoder().decode(ArticleResults.self, from: data)
        let articles: [Article] = json.results.compactMap(transform)
        return articles
    }
    
    func loadArticles() {
        shouldShowActivityIndicator?(true)
        
        Task {
            let articles = try await fetchArticle()
            await MainActor.run {
                handleJson(with: articles)
            }
        }
    }
    
    func handleJson(with json: [Article]) {
        onLoadArticles?(json)
        shouldShowActivityIndicator?(false)
    }
    
    func transform(_ jsonArticle: ArticleJson) -> Article? {
        guard let title = jsonArticle.title,
              let creator = jsonArticle.creator,
              let category = jsonArticle.category.first,
              let author = jsonArticle.creator?.first,
              let content = jsonArticle.content else { return nil }
        return Article(title: title,
                              author: author,
                              publishedAt: jsonArticle.pubDate,
                              category: category,
                              imageURL: jsonArticle.image_url,
                              content: content)
    }
}
