//
//  NewsCell.swift
//  News_Uikit
//
//  Created by Arshif on 19/06/2024.
//

import UIKit

class NewsCell: UITableViewCell {
    
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
        
        let categoryColor = UIColor(red: 105/255, green: 189/255, blue: 253/255, alpha: 1)
        let titleColor = UIColor(red: 24/255, green: 14/255, blue: 25/255, alpha: 1)
        let publishedByColor = UIColor(red: 144/255, green: 144/255, blue: 144/255, alpha: 1)
        let dateColor = UIColor(red: 144/255, green: 144/255, blue: 144/255, alpha: 1)
        
        
        labelTitle.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        labelPublishedBy.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        labelDate.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        labelCategory.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        
        labelTitle.textColor = titleColor
        labelPublishedBy.textColor = publishedByColor
        labelCategory.textColor = categoryColor
        labelDate.textColor = dateColor
        
    }
}
