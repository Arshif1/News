//
//  NewsListView.swift
//  News
//
//  Created by Arshif on 30/05/2024.
//
import Foundation


import SwiftUI

struct ArticleListView: View {
    
    @ObservedObject private var newsListViewModel = NewsListViewModel()

    var body: some View {
        NavigationStack {
            GeometryReader { metrices in
                List(newsListViewModel.newsItems) { article in
                    ZStack {
                        ArticleView(height: metrices.size.width * 128 / 345, article: article)
                            .listRowInsets(.init())
                            .padding(.horizontal, 15)
                            .padding(.bottom, 16)
                        NavigationLink {
                            ArticleDetailView(article: article)
                        } label: {
                            EmptyView()
                        }.opacity(0)
                    }
                }
                .listStyle(.grouped)
            }
        }
    }
}
