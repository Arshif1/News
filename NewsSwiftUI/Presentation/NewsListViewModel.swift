//
//  NewsListViewModel.swift
//  News
//
//  Created by Arshif on 01/06/2024.
//

import Foundation
import News_Package

class NewsListViewModel: ObservableObject {
    
    private let articleLoader = ArticleLoader()
    
    @Published var articles: [Article] = []
    
    init() {
        loadNews()
    }
    
    private func loadNews() {
        Task {
            guard let loadedArticles = try? await articleLoader.loadArticles() else { return }
            await MainActor.run {
                self.articles = loadedArticles
            }
        }
    }
    
    private func loadNews(searchText: String) {
        Task {
            guard let loadedArticles = try? await articleLoader.load(With: searchText) else { return }
            await MainActor.run {
                articles = loadedArticles
            }
        }
    }
}
