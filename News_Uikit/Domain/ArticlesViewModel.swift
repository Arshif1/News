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
    
    private var base: String {
        "https://newsdata.io/api/1/latest?apikey=pub_457050f3022a220f2fee7f26b7bedf2ce8912&language=en"
    }
    
    private var urlString: String {
        guard let nextPage else {
            return base
        }
        return base + "&page=\(nextPage)"
    }
    
    var nextPage: String?
    private var isLoading = false
    
    func loadArticles() {
        guard !isLoading else { return }
        isLoading = true
        shouldShowActivityIndicator?(true)
        Task {
            do {
                let response = try await fetchJSONResponse()
                await handleJsonResponse(json: response)
            } catch {
                await handleFailure()
            }
        }
    }
    
    private func fetchJSONResponse() async throws -> ArticleResults {
        guard let url = URL(string: urlString) else {
            throw NSError(domain: "invalid url", code: 0)
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(ArticleResults.self, from: data)
    }
    
    private func handleJsonResponse(json: ArticleResults) async {
        nextPage = json.nextPage
        let articles = json.results.compactMap(transform)
        await handleArticles(articles: articles)
    }
    
    private func handleArticles(articles: [Article]) async {
        await MainActor.run {
            onLoadArticles?(articles)
            shouldShowActivityIndicator?(false)
            isLoading = false
        }
    }
    
    private func handleFailure() async {
        await MainActor.run {
            shouldShowActivityIndicator?(false)
            isLoading = false
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
