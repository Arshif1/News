//
//  NewsListViewModel.swift
//  News_UiKit
//
//  Created by Azhar on 13/08/2024.
//

import Foundation
import News

class NewsListViewModel {
    
    var onarticlesLoadedClosure: (([Article]) -> Void)?
    
    private let articleLoader = ArticleLoader()
    
    func loadNews() {
        Task {
            guard let loadedArticles = try? await articleLoader.loadArticles() else { return }
            await MainActor.run {
                onarticlesLoadedClosure?(loadedArticles)
            }
        }
    }
    
    func load(with searchText: String) {
        Task {
            guard let loadedArticles = try? await articleLoader.load(With: searchText) else { return }
            await MainActor.run {
                onarticlesLoadedClosure?(loadedArticles)
            }
        }
    }
    
}
