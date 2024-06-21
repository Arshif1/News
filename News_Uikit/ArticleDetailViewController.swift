//
//  DetailNewsView.swift
//  News_Uikit
//
//  Created by Arshif on 20/06/2024.
//

import UIKit

class ArticleDetailViewController: UIViewController {

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
        
        let article = Article.create()
        
        labelTitle.text = article.title
        labelPublishedBy.text = article.author
        labelPublishedAt.text = article.publishedAt
        labelContent.text = article.content
    }
}
