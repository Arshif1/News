//
//  DetailNewsView.swift
//  News_Uikit
//
//  Created by Arshif on 20/06/2024.
//

import UIKit

class DetailNewsViewController: UIViewController {

    @IBOutlet private weak var newsImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var publishedByLabel: UILabel!
    @IBOutlet private weak var publishedAtLabel: UILabel!
    @IBOutlet private weak var contentLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupViews()
        distributeData()
    }
    
    func create() -> NewsArticle {
        
        NewsArticle(title: "Monarch population soars 4,900 percent since last year in thrilling 2021 western migration", author: "By Andy Corbley", publishedAt: "1m ago", content: "When just 200 Western monarch butterflies arrived in the Pismo Beach Butterfly Grove from their northerly migration last year, park rangers feared the treasured insect would soon be gone forever.This year, however, volunteers tallied their numbers at over 100,000, a spectacular swarm of hope that traveled down from as far north as Canada to the spend the winter on the California coast.It’s expected that the monarch butterfly will be placed on the Endangered Species List soon, due to declines in both western and eastern monarch butterfly numbers. Genetically indistinguishable, they are separate merely for the fact that monarchs living and migrating east of the Rockies overwinter in Mexico, while those on the western side of the Rockies overwinter along California’s west coast.at over 100,000, a spectacular swarm of hope that traveled down from as far north as Canada to the spend the winter on the California coast.It’s expected that the monarch butterfly will be placed on the Endangered Species List soon, due to declines in both western and eastern monarch butterfly numbers. Genetically indistinguishable, they are separate merely for the fact that monarchs living and migrating east of the Rockies overwinter in Mexico, while those on the western side of the Rockies overwinter.")
    }
    
    private func setupViews() {
        
        titleLabel.font = .boldHeader1
        publishedByLabel.font = .mediumHeader2
        publishedAtLabel.font = .mediumHeader2
        contentLabel.font = .paragraphText1
        
        titleLabel.textColor = .mainTextColor
        publishedByLabel.textColor = .greyTextColor
        publishedAtLabel.textColor = .greyTextColor
        contentLabel.textColor = UIColor.black
    }
    
    func distributeData() {
        
        let newsArticle: NewsArticle = create()
        
        titleLabel.text = newsArticle.title
        publishedByLabel.text = newsArticle.author
        publishedAtLabel.text = newsArticle.publishedAt
        contentLabel.text = newsArticle.content
    }
}
