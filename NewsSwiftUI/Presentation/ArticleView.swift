//
//  ArticleView.swift
//  News
//
//  Created by Arshif on 30/05/2024.
//

import Foundation
import SwiftUI
import News

struct ArticleView: View {
    
    let article: Article
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            AsyncImage(url: article.imageURL, content: { image in
                image.resizable()
            }, placeholder: {
                HStack {
                    Spacer()
                    VStack(alignment: .center) {
                        Spacer()
                        Image(systemName: "photo.artframe")
                        Spacer()
                    }
                    Spacer()
                }.frame(height: 200)
            }).frame(height: 200)
            Text(article.displayDate)
                .foregroundColor(.grayTextColor)
                .font(.system(size: 10, weight: .light, design: .serif))
            Text(article.title)
                .foregroundColor(.primaryTextColor)
                .font(.system(size: 14, weight: .semibold, design: .serif))
            Text(article.description)
                .foregroundColor(Color.black)
                .font(.system(size: 12, weight: .light, design: .serif))
            Text(article.author)
                .foregroundColor(.grayTextColor)
                .font(.system(size: 10, weight: .semibold, design: .serif))
        }
    }
}
