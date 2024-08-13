//
//  DetailView.swift
//  News
//
//  Created by Arshif on 02/06/2024.
//

import SwiftUI

struct ArticleDetailView: View {
    
    let article: Article
    @Environment(\.openURL) var openURL
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                imageView
                contentView
            }
            titleView
                .background(Color.titleViewBackgroundColor, in: RoundedRectangle(cornerRadius: 10))
                .padding(.horizontal, 24)
                .frame(height: 140)
        }.navigationTitle("Detail")
    }
    
    private var imageView: some View {
        AsyncImage(url: article.imageURL) { image in
            image.resizable()
        } placeholder: {
            ProgressView()
        }
    }
    
    private var contentView: some View {
        ZStack {
            Color.white
            ScrollView(showsIndicators: false) {
                Text(article.content)
                    .font(.system(size: 16, weight: .regular, design: .serif))
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top, 86)
        }
    }
    
    private var titleView: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("a Date")
                    .font(.system(size: 10, weight: .light, design: .serif))
                Spacer()
                Text(article.title)
                    .font(.system(size: 18, weight: .bold, design: .serif))
                Spacer()
                Text(article.author)
                    .font(.system(size: 10, weight: .medium, design: .serif))

            }
            .padding(.leading)
            .padding(.top)
            .padding(.bottom)
            Spacer()
            
            if let url = article.detailURL {
                Button("Go to Webpage") {
                    openURL(url)
                }
            }
        }
    }
}
