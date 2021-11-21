//
//  FavoriteViewController.swift
//  SportsGames
//
//  Created by Mac on 20/11/21.
//

import UIKit

class FavoriteViewController: UIViewController {
    @IBOutlet weak var favoriteItemsTableView: UITableView!
    
    var items = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favoriteItemsTableView.tableFooterView = UIView()
    }
    
}

extension FavoriteViewController: UITableViewDataSource {
    //MARK: UITableViewDataSource Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let favoriteItemCell = favoriteItemsTableView.dequeueReusableCell(withIdentifier: "FavoriteItemsTableViewCell", for: indexPath) as? FavoriteItemsTableViewCell {
            let item = items[indexPath.row]
            favoriteItemCell.sportNameLabel.text = item.sportName
            favoriteItemCell.itemNameLabel.text = item.itemName
            return favoriteItemCell
        } else {
            return UITableViewCell()
        }
    }
}

extension FavoriteViewController: UITableViewDelegate {
    
    //MARK: UITableViewDelegate Methods
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        180
    }

}
