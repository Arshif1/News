//
//  ArticleListCell.swift
//  News_UiKit
//
//  Created by Azhar on 13/08/2024.
//

import UIKit
import News

class ArticleListCell: UITableViewCell {
    
    var article: Article? {
        didSet {
            guard let article else { return }
            configure(with: article)
        }
    }
    @IBOutlet weak var imageViewArticle: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelPublishedBy: UILabel!
    
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelCategory: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    private func setupViews() {
        selectionStyle = .none
        labelTitle.font = .boldHeader2
        labelPublishedBy.font = .mediumHeader2
        labelDate.font = .mediumHeader2
        labelCategory.font = .boldHeader3
        
        labelTitle.textColor = .secondaryTextColor
        labelPublishedBy.textColor = .greyTextColor
        labelCategory.textColor = .highlightTextColor
        labelDate.textColor = .greyTextColor
    }
    
    private func configure(with article: Article) {
        labelTitle.text = article.title
        labelDate.text = article.displayDate
        labelPublishedBy.text = article.author
        labelCategory.text = "n/a"
        imageViewArticle.loadImage(from: article.imageURL)
    }
    
}
