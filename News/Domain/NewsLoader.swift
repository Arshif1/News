//
//  NewsLoader.swift
//  News
//
//  Created by Arshif on 30/05/2024.
//

import Foundation

class ArticleLoader {
    
    let apiKey = "6db927ab9f5646ce94d25a07d6ec11a1"
    
    var urlString: String {
        "https://newsapi.org/v2/everything?q=apple&from=2024-05-29&to=2024-05-29&sortBy=popularity&apiKey=\(apiKey)"
    }
    
    var currentTask: Task<[Article], Error>?
    private var nextPage: String?
    private var searchText: String?
    
    func loadNews() async throws -> (articles: [Article], nextPage: String?) {
        guard let url = URL(string: urlString) else { return ([], nil) }
        let (data, _) = try await URLSession.shared.data(from: url)
        let json = try JSONDecoder().decode(ArticlesJSON.self, from: data)
        return (transform(json: json), json.nextPage)
    }
    
    private func loadArticlesFromTask() async throws -> [Article] {
        currentTask = Task {
            let (aricles, nextpage) = try await loadNews()
            return await MainActor.run {
                self.nextPage = nextpage
                return aricles
            }
        }
        return try await currentTask?.value ?? []
    }
    
    func loadArticles() async throws -> [Article] {
        try await loadArticlesFromTask()
    }
    
    func load(With searchText: String) async throws -> [Article] {
        await MainActor.run {
            self.searchText = searchText
            self.nextPage = nil
        }
        currentTask?.cancel()
        return try await loadArticlesFromTask()
    }
    
    private func transform(json: ArticlesJSON) -> [Article] {
        var articles = [Article]()
        for jsonArticle in json.articles {
            if let author = jsonArticle.author, let description = jsonArticle.description, let date = ISO8601DateFormatter().date(from: jsonArticle.publishedAt)  {
                let new = Article(title: jsonArticle.title, date: date, imageURL: jsonArticle.urlToImage, author: author, description: description, detailURL: nil, content: jsonArticle.content)
                articles.append(new)
            }
        }
        return articles
    }
}
