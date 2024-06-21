//
//  ArticleCell.swift
//  News
//
//  Created by Arshif on 20/06/2024.
//

import SwiftUI

struct ArticleView: View {
    
    let news: Article
    @Binding var path: NavigationPath
    
    var body: some View {
        HStack(spacing: 15) {
            imageView
            contentView
        }
        .frame(height: 140)
        .onTapGesture {
            path.append(news)
        }
    }
    
    private var imageView: some View {
        Color.red
            .frame(width: 137)
    }
    
    private var contentView: some View {
        VStack(alignment: .leading, spacing: 5) {
            
            Text(news.title)
                .foregroundColor(.primaryTextColor)
                .font(.boldHeader2)
                .lineLimit(3)
            Spacer()
            
            Text(news.author)
                .foregroundColor(.greyTextColor)
                .font(.mediumHeader2)
                
            
            
            HStack(spacing: 10) {
                Text(news.category)
                    .foregroundColor(.highlightTextColor)
                    .font(.boldHeader3)
                Text(news.publishedAt)
                    .foregroundColor(.greyTextColor)
                    .font(.mediumHeader2)
            }
            
            Color.seperatorColor
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .frame(height: 1)
            
        }
        .frame(maxWidth: .infinity)
        
    }

}

#Preview {
    ArticleView(news: Article(title: "Monarch population soars 4,900 percentpopulation soars 4,900 percentpopulation soars 4,900 percentpopulation soars 4,900 percentpopulation soars 4,900 percentpopulation soars 4,900 percentpopulation soars 4,900 percent since last year in thrilling 2021 western migration", author: "By Andy Corbley", publishedAt: "5m ago", category: "Entertainment", content: "cshbjacbjhscjhws bcjbsj`ckjs"), path: .constant(NavigationPath()))
}
  


