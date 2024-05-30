//
//  NewsListView.swift
//  News
//
//  Created by Arshif on 30/05/2024.
//
import Foundation


import SwiftUI

struct NewsListView: View {
    
    let news: [News] = News.dummyNews()
    
    var body: some View {
        GeometryReader { metrices in
            List(news) { item in
                NewsCell(height: metrices.size.width * 128 / 345, news: item)
                    .listRowInsets(.init())
                    .padding(.horizontal, 15)
                    .padding(.bottom, 16)
            }
            .listStyle(.grouped)
        }
    }
}
