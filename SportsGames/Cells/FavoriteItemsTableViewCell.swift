//
//  FavoriteItemsTableViewCell.swift
//  SportsGames
//
//  Created by Mac on 20/11/21.
//

import UIKit

class FavoriteItemsTableViewCell: UITableViewCell {

    @IBOutlet weak var sportNameLabel: UILabel!
    @IBOutlet weak var itemNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
