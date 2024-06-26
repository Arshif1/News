//
//  DetailNewsView.swift
//  News_Uikit
//
//  Created by Arshif on 20/06/2024.
//

import UIKit

class ArticleDetailViewController: UIViewController {

    var article: Article?
    
    @IBOutlet private weak var imageViewNews: UIImageView!
    @IBOutlet private weak var labelTitle: UILabel!
    @IBOutlet private weak var labelPublishedBy: UILabel!
    @IBOutlet private weak var labelPublishedAt: UILabel!
    @IBOutlet private weak var labelContent: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        populateArticle()
    }
    
    private func setupViews() {
        title = "Article"
        
        labelTitle.font = .boldHeader1
        labelPublishedBy.font = .mediumHeader2
        labelPublishedAt.font = .mediumHeader2
        labelContent.font = .paragraphText1
        
        labelTitle.textColor = .primaryTextColor
        labelPublishedBy.textColor = .greyTextColor
        labelPublishedAt.textColor = .greyTextColor
        labelContent.textColor = UIColor.black
    }
    
    private func populateArticle() {
        guard let article else { return }
        labelTitle.text = article.title
        labelPublishedBy.text = article.author
        labelPublishedAt.text = article.publishedAt
        labelContent.text = article.content
        imageViewNews.loadImage(from: article.imageURL)
    }
}
