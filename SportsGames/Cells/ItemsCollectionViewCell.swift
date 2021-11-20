//
//  ItemsCollectionViewCell.swift
//  SportsGames
//
//  Created by Mac on 20/11/21.
//

import UIKit

protocol ItemsCollectionViewCellProtocol: AnyObject {
    func passData(itemCell: ItemsCollectionViewCell)
}

class ItemsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var itemLabel: UILabel!
    weak var delegate : ItemsCollectionViewCellProtocol?
    
    @IBAction func itemBtnAction(_ sender: Any) {
        delegate?.passData(itemCell: self)
    }
}
