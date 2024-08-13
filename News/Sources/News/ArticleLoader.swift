//
//  NewsLoader.swift
//  News
//
//  Created by Arshif on 30/05/2024.
//

import Foundation

public class ArticleLoader {
    
    let apiKey = "pub_48790118712cacefc454a1ba59b065d8d5846"
    
    var urlString: String {
        "https://newsdata.io/api/1/latest?&apikey=\(apiKey)&language=en"
    }
    
    var currentTask: Task<[Article], Error>?
    private var nextPage: String?
    private var searchText: String?
    
    public init() { }
    
    public func loadArticles() async throws -> [Article] {
        try await loadArticlesFromTask()
    }
    
    public func load(With searchText: String) async throws -> [Article] {
        await MainActor.run {
            self.searchText = searchText
            self.nextPage = nil
        }
        currentTask?.cancel()
        return try await loadArticlesFromTask()
    }
    
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
    
    private func transform(json: ArticlesJSON) -> [Article] {
        var articles = [Article]()
        for jsonArticle in json.results {
            if let description = jsonArticle.description {
                let article = Article(id: jsonArticle.article_id, title: jsonArticle.title, date: .now, imageURL: jsonArticle.image_url, author: "An author", description: description, detailURL: jsonArticle.link, content: jsonArticle.content)
                articles.append(article)
            }
        }
        return articles
    }
}
