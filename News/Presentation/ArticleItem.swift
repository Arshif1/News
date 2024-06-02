//
//  News.swift
//  News
//
//  Created by Arshif on 30/05/2024.
//

import Foundation

struct ArticleItem: Identifiable {
    let id: UUID
    let imageURL: URL?
    let date: String
    let title: String
    let description: String
    let publishedBy: String
    
    static func dummyNews() -> [ArticleItem] {
        [
            ArticleItem(id: UUID(), imageURL: nil, date: "Sunday, 9 May 2021", title: "What to do if you're planning or attending a wedding during the pandemic", description: "They had the artsy, rustic venue, the tailored dress and a guest list including about 150 of their closest friends and family. But the pandemic had other plans, forcing Carly Chalmers and Mitchell Gauvin to make a difficult decision about their wedding", publishedBy: "Published by Kristen Rogers"),
            ArticleItem(id: UUID(), imageURL: nil, date: "Sunday, 9 May 2021", title: "What to do if you're planning or attending a wedding during the pandemic", description: "They had the artsy, rustic venue, the tailored dress and a guest list including about 150 of their closest friends and family. But the pandemic had other plans, forcing Carly Chalmers and Mitchell Gauvin to make a difficult decision about their wedding... Read More", publishedBy: "by Kristen Rogers"),
            ArticleItem(id: UUID(), imageURL: nil, date: "Sunday, 9 May 2021", title: "What to do if you're planning or attending a wedding during the pandemic", description: "a Description", publishedBy: "by Kristen Rogers")
        ]
    }
}
