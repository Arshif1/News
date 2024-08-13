//
//  ArticleListCell.swift
//  News_UiKit
//
//  Created by Azhar on 13/08/2024.
//

import UIKit

class ArticleListCell: UITableViewCell {
    
    @IBOutlet weak var labelTitle: UILabel?
    @IBOutlet weak var labelDescription: UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
