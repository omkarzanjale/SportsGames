//
//  SideMenuViewController.swift
//  SportsGames
//
//  Created by Mac on 20/11/21.
//

import UIKit

class SideMenuViewController: UIViewController {

    @IBOutlet weak var menuTableView: UITableView!
    let menus  = ["Home","Favorite","All"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
extension SideMenuViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        menus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let menuCell = menuTableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as? MenuCell {
            menuCell.menuLabel.text = menus[indexPath.row]
            return menuCell
        } else {
            return UITableViewCell()
        }
    }
    
    
}
