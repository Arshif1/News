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
        do {
            let dto = try JSONDecoder().decode(ArticlesDTO.self, from: data)
            return transform(dto: dto)
        } catch {
            print(error)
            return []
        }

    }
    
    private func transform(dto: ArticlesDTO) -> [Article] {
        var returnable = [Article]()
        
        for articleDTo in dto.articles {
            
            if let author = articleDTo.author {
                let new = Article(date: .now, imageURL: nil, author: author, description: "", detailURL: nil, content: "")
                returnable.append(new)
            }
            
        }
        
        return returnable
    }

}



