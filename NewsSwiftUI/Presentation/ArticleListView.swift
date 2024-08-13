//
//  NewsListView.swift
//  News
//
//  Created by Arshif on 30/05/2024.
//
import SwiftUI
import News

struct ArticleListView: View {
    
    @ObservedObject private var newsListViewModel = NewsListViewModel()
    
    @State var selectedArticle: Article?

    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                ForEach(newsListViewModel.articles) { article in
                    ZStack {
                        ArticleView(article: article)
                            .padding(.bottom, 10)
                            .padding(.horizontal, 10)
                            .onTapGesture {
                                selectedArticle = article
                            }
                    }
                    
                }.padding(.top, 10)
            }
        }.navigationDestination(item: $selectedArticle) { article in
            ArticleDetailView(article: article)
        }
    }
}

extension Article: Identifiable, Hashable {
    
    public static func == (lhs: Article, rhs: Article) -> Bool {
        lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
