//
//  Article.swift
//  News_Uikit
//
//  Created by Arshif on 20/06/2024.
//

import Foundation
struct Article {
    let title: String
    let author: String?
    let publishedAt: String
    let content: String?
    
   static func create() -> Article {
        Article(title: "Monarch population soars 4,900 percent since last year in thrilling 2021 western migration", author: "By Andy Corbley", publishedAt: "1m ago", content: "When just 200 Western monarch butterflies arrived in the Pismo Beach Butterfly Grove from their northerly migration last year, park rangers feared the treasured insect would soon be gone forever.This year, however, volunteers tallied their numbers at over 100,000, a spectacular swarm of hope that traveled down from as far north as Canada to the spend the winter on the California coast.It’s expected that the monarch butterfly will be placed on the Endangered Species List soon, due to declines in both western and eastern monarch butterfly numbers. Genetically indistinguishable, they are separate merely for the fact that monarchs living and migrating east of the Rockies overwinter in Mexico, while those on the western side of the Rockies overwinter along California’s west coast.at over 100,000, a spectacular swarm of hope that traveled down from as far north as Canada to the spend the winter on the California coast.It’s expected that the monarch butterfly will be placed on the Endangered Species List soon, due to declines in both western and eastern monarch butterfly numbers. Genetically indistinguishable, they are separate merely for the fact that monarchs living and migrating east of the Rockies overwinter in Mexico, while those on the western side of the Rockies overwinter.")
    }
}
