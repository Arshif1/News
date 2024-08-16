//
//  ArticleDetailViewController.swift
//  News_UiKit
//
//  Created by Arshif on 16/08/2024.
//

import UIKit
import News

class ArticleDetailViewController: UIViewController {

    var article: Article?
    
    
    @IBOutlet weak var imageViewNews: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelPublishedBy: UILabel!
    
    @IBOutlet weak var labelPublishedAt: UILabel!
    
    @IBOutlet weak var labelContent: UILabel!
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
        labelPublishedAt.text = article.displayDate
        labelContent.text = article.description
        imageViewNews.loadImage(from: article.imageURL)
    }
}

