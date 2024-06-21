//
//  ArticleCell.swift
//  News_Uikit
//
//  Created by Arshif on 19/06/2024.
//

import UIKit

class ArticleCell: UITableViewCell {
    
    @IBOutlet private weak var newsImageView: UIImageView!
    @IBOutlet private weak var labelTitle: UILabel!
    @IBOutlet private weak var labelPublishedBy: UILabel!
    @IBOutlet private weak var labelCategory: UILabel!
    @IBOutlet private weak var labelDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
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
}
