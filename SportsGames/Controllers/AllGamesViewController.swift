//
//  AllGamesViewController.swift
//  SportsGames
//
//  Created by Mac on 20/11/21.
//

import UIKit

class AllGamesViewController: UIViewController {
    let sports = ["Cricket", "Football"]
    @IBOutlet weak var AllGamesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AllGamesTableView.tableFooterView = UIView()
    }
}
//
//MARK: UITableViewDataSource
//
extension AllGamesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sports.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let sportCell = AllGamesTableView.dequeueReusableCell(withIdentifier: "SportsTableViewCell", for: indexPath) as? SportsTableViewCell {
            sportCell.sportLabel.text = sports[indexPath.row]
            return sportCell
        } else {
            return UITableViewCell()
        }
    }
}
//
//MARK: UITableViewDelegate
//
extension AllGamesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let itemsViewControllerObj = storyboard?.instantiateViewController(withIdentifier: "ItemsViewController") as? ItemsViewController {
            itemsViewControllerObj.sportName = sports[indexPath.row]
            navigationController?.pushViewController(itemsViewControllerObj, animated: true)
        }
        
    }

}

