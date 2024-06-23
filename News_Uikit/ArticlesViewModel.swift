//
//  ArticlesViewModel.swift
//  News_Uikit
//
//  Created by Arshif on 23/06/2024.
//

import Foundation
class ArticlesViewModel {
    
    var onLoadArticles: (([Article]) -> ())?
    private let urlString = "https://newsdata.io/api/1/latest?apikey=pub_457050f3022a220f2fee7f26b7bedf2ce8912&q=pegasus&language=en"
    
    func fetchArticle() async throws -> [Article] {
        guard let url = URL(string: urlString) else { return [] }
        let (data, _) = try await URLSession.shared.data(from: url)
        let json = try JSONDecoder().decode(ArticleResults.self, from: data)
        return json.results
    }
    
    func loadArticle() {
        Task {
            let articles = try await fetchArticle()
            await MainActor.run {
                handleJson(with: articles)
            }
        }
    }
    
    func handleJson(with json: [Article]) {
        onLoadArticles?(json)
    }
}
