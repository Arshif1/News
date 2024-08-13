//
//  Article
//
//  Created by Arshif on 01/06/2024.
//

import Foundation

public struct Article {
    public let id: String
    public let title: String
    public let date: Date
    public let imageURL: URL?
    public let author: String
    public let description: String
    public let detailURL: URL?
    public let content: String
    
    public var displayDate: String {
        displayDate(from: date)
    }
    
    public init(id: String, title: String, date: Date, imageURL: URL?, author: String, description: String, detailURL: URL?, content: String) {
        self.id = id
        self.title = title
        self.date = date
        self.imageURL = imageURL
        self.author = author
        self.description = description
        self.detailURL = detailURL
        self.content = content
    }
    
    private func displayDate(from date: Date) -> String {
        let formatter = DateFormatter()
        let dateformat = "EEEE, d MMM yyyy"
        formatter.dateFormat = dateformat
        return formatter.string(from: date)
    }
}
