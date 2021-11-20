//
//  ItemsViewController.swift
//  SportsGames
//
//  Created by Mac on 20/11/21.
//

import UIKit

class ItemsViewController: UIViewController {

    var sportName: String?
    
    var itemArrayForCriket = ["Bat","Ball","Stump","Helmet"," Mouth Guard","Gloves","Hip and Knee Pads"]
    var itemsArrayForFootball = ["Football","Helmet","Jockstrap"," Mouth Guard","Hip and Knee Pads"," Shoulder Pads","Gloves"]
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
}
extension ItemsViewController: UICollectionViewDelegate{
    
}
extension ItemsViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        itemArrayForCriket.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemsCollectionViewCell", for: indexPath) as? ItemsCollectionViewCell{
            if sportName == "Cricket" {
                itemCell.itemLabel.text = itemArrayForCriket[indexPath.row]
            } else if sportName == "FootBall" {
                itemCell.itemLabel.text = itemsArrayForFootball[indexPath.row]
            }
            itemCell.delegate = self
            return itemCell
        } else {
            return UICollectionViewCell()
        }
    }
}
//
//MARK: UICollectionViewDelegateFlowLayout
//
extension ItemsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width-20
        let height = CGFloat(200)
        return CGSize(width: width, height: height)
    }
}

extension ItemsViewController: ItemsCollectionViewCellProtocol{
    
    func passData(itemCell: ItemsCollectionViewCell) {
        guard let itemName = itemCell.itemLabel.text else {
            return
        }
        guard let sportName = sportName else {
            return
        }
        DBHelper().insertUser(sportName: sportName, itemName: itemName)
    }
}
