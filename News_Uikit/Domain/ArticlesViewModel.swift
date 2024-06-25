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
    private let urlString = "https://newsdata.io/api/1/latest?apikey=pub_457050f3022a220f2fee7f26b7bedf2ce8912&language=en&country=ae"
    
    func loadArticles() {
        shouldShowActivityIndicator?(true)
        Task {
            do {
                let articles = try await fetchArticle()
                await handleJson(with: articles)
            } catch {
                await handleFailure()
            }
        }
    }
    
    private func fetchArticle() async throws -> [Article] {
        guard let url = URL(string: urlString) else { return [] }
        let (data, _) = try await URLSession.shared.data(from: url)
        let json = try JSONDecoder().decode(ArticleResults.self, from: data)
        let articles: [Article] = json.results.compactMap(transform)
        return articles
    }
    
    private func handleJson(with json: [Article]) async {
        await MainActor.run {
            onLoadArticles?(json)
            shouldShowActivityIndicator?(false)
        }
    }
    
    private func handleFailure() async {
        await MainActor.run {
            shouldShowActivityIndicator?(false)
        }
    }
    
    private func transform(_ jsonArticle: ArticleJson) -> Article? {
        guard let title = jsonArticle.title,
              let category = jsonArticle.category.first,
              let content = jsonArticle.description else { return nil }
        return Article(title: title,
                       author: jsonArticle.creator?.first,
                       publishedAt: jsonArticle.pubDate,
                       category: category,
                       imageURL: jsonArticle.image_url,
                       content: content)
    }
}
