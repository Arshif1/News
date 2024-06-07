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
    
    @State var selectedArticle: ArticleItem?

    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                ForEach(newsListViewModel.newsItems) { article in
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
