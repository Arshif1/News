//
//  Article
//
//  Created by Arshif on 01/06/2024.
//

import Foundation

struct Article {
    let id: String
    let title: String
    let date: Date
    let imageURL: URL?
    let author: String
    let description: String
    let detailURL: URL?
    let content: String
    
    var displayDate: String {
        displayDate(from: date)
    }
    
    private func displayDate(from date: Date) -> String {
        let formatter = DateFormatter()
        let dateformat = "EEEE, d MMM yyyy"
        formatter.dateFormat = dateformat
        return formatter.string(from: date)
    }
}
