//
//  NewsListView.swift
//  News
//
//  Created by Arshif on 30/05/2024.
//
import Foundation


import SwiftUI

struct NewsListView: View {
    
    @ObservedObject private var newsListViewModel = NewsListViewModel()

    var body: some View {
        GeometryReader { metrices in
            List(newsListViewModel.newsItems) { item in
                ArticleView(height: metrices.size.width * 128 / 345, article: item)
                    .listRowInsets(.init())
                    .padding(.horizontal, 15)
                    .padding(.bottom, 16)
            }
            .listStyle(.grouped)
        }
    }
}
