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
    
    func loadNews() async throws -> [Article] {
        guard let url = URL(string: urlString) else { return [] }
        let (data, _) = try await URLSession.shared.data(from: url)
        let json = try JSONDecoder().decode(ArticlesJSON.self, from: data)
        let articles: [Article] = transform(json: json)
        return articles
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
