//
//  DetailNewsView.swift
//  News
//
//  Created by Arshif on 21/06/2024.
//

import SwiftUI

struct DetailNewsView: View {
    
    let newsitem: Article
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 10){
                Color.brown
                    .frame(width: 393, height: 229)
                cellWrittenContent
                Spacer()
            }
        }
    }
    
    var cellWrittenContent: some View {
            VStack(alignment: .leading, spacing: 10) {
                
                Text(newsitem.title)
                    .foregroundColor(.primaryTextColor)
                    .font(.boldHeader2)
                
                Text(newsitem.author ?? "")
                    .foregroundColor(.greyTextColor)
                    .font(.mediumHeader2)
                
                HStack(spacing: 10) {
                    Text(newsitem.category)
                        .foregroundColor(.highlightTextColor)
                        .font(.boldHeader3)
                    Text(newsitem.publishedAt)
                        .foregroundColor(.greyTextColor)
                        .font(.mediumHeader2)
                }
                
                Text(newsitem.content ?? "")
                    .foregroundColor(.black)
                    .font(.paragraphText1)
            }
            .frame(maxWidth: .infinity)
            .padding()
        }
    }


#Preview {
    DetailNewsView(newsitem: Article(title: "Monarch population soars 4,900 percent since last year in thrilling 2021 western migration", author: "By Andy Corbley", publishedAt: "5m ago", category: "Entertainment", content: "When just 200 Western monarch butterflies arrived in the Pismo Beach Butterfly Grove from their northerly migration last year, park rangers feared the treasured insect would soon be gone forever.This year, however, volunteers tallied their numbers at over 100,000, a spectacular swarm of hope that traveled down from as far north as Canada to the spend the winter on the California coast. It’s expected that the monarch butterfly will be placed on the Endangered Species List soon, due to declines in both western and eastern monarch butterfly numbers. Genetically indistinguishable, they are separate merely for the fact that monarchs living and migrating east of the Rockies overwinter in Mexico, while those on the western side of the Rockies overwinter along California’s west coast.a coast. It’s expected that the monarch butterfly will be placed on the Endangered Species List soon, due to declines in both western and eastern monarch butterfly numbers. Genetically indistinguishable, they are separate merely for the fact that monarchs living and migrating east of the Rockies overwinter in Mexico, while those on the western side of the Rockies overwina coast. It’s expected that the monarch butterfly will be placed on the Endangered Species List soon, due to declines in both western and eastern monarch butterfly numbers. Genetically indistinguishable, they are separate merely for the fact that monarchs living and migrating east of the Rockies overwinter in Mexico, while those on the western side of the Rockies overwina coast. It’s expected that the monarch butterfly will be placed on the Endangered Species List soon, due to declines in both western and eastern monarch butterfly numbers. Genetically indistinguishable, they are separate merely for the fact that monarchs living and migrating east of the Rockies overwinter in Mexico, while those on the western side of the Rockies overwin"))
}
