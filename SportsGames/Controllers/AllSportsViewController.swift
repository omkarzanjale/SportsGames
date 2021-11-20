//
//  AllSportsViewController.swift
//  SportsGames
//
//  Created by Mac on 20/11/21.
//

import UIKit

class AllSportsViewController: UIViewController {

    @IBOutlet weak var allSportsTableView: UITableView!
    
    let sports = ["Cricket", "Football"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
extension AllSportsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sports.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let sportCell = allSportsTableView.dequeueReusableCell(withIdentifier: "SportsTableViewCell", for: indexPath) as? SportsTableViewCell {
            sportCell.sportLabel.text = sports[indexPath.row]
            return sportCell
        } else {
            return UITableViewCell()
        }
    }
}
