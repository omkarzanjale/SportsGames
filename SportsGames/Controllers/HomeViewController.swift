//
//  ViewController.swift
//  CemtrexLabs machine test
//
//  Created by Somnath on 27/08/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: Global Variables
    
    @IBOutlet weak var sideView: UIView!
    @IBOutlet weak var menuTableView: UITableView!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginIdTextField: UITextField!
    
    let menuArray = ["Home","Favorite","All Games"]
   
    var isSideViewOpen : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sideView.isHidden = true
        isSideViewOpen = false
        title = "Home"
    }
    
    @IBAction func loginBtnAction(_ sender: Any) {
        
    }
    
    //MARK: Handle Menu UI
    func handleMenu()  {
        menuTableView.isHidden = false
        sideView.isHidden = false
        self.view.bringSubviewToFront(sideView)
        if !isSideViewOpen {
            isSideViewOpen = true//0
            sideView.frame = CGRect(x: 0, y: 88, width: 0, height: 499)
            menuTableView.frame = CGRect(x: 0, y: 0, width: 0, height: 499)
            UIView.animate(withDuration: 0.3) { [weak self] in
                self?.view.layoutIfNeeded()
            }
            sideView.frame = CGRect(x: 0, y: 88, width: 259, height: 499)
            menuTableView.frame = CGRect(x: 0, y: 0, width: 259, height: 499)
            UIView.animate(withDuration: 0.3) { [weak self] in
                self?.view.layoutIfNeeded()
            }
        } else {
            menuTableView.isHidden = true
            sideView.isHidden = true
            isSideViewOpen = false
            sideView.frame = CGRect(x: 0, y: 88, width: 259, height: 499)
            menuTableView.frame = CGRect(x: 0, y: 0, width: 259, height: 499)
            UIView.animate(withDuration: 0.3) { [weak self] in
                self?.view.layoutIfNeeded()
            }
            
            sideView.frame = CGRect(x: 0, y: 88, width: 0, height: 499)
            menuTableView.frame = CGRect(x: 0, y: 0, width: 0, height: 499)
            UIView.animate(withDuration: 0.3) { [weak self] in
                self?.view.layoutIfNeeded()
            }
            
        }
    }
    
    @IBAction func menuButtonPressed(_ sender: Any) {
        self.handleMenu()
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    //MARK: UITableViewDataSource Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == menuTableView {
            let menuCell = menuTableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath)
            menuCell.textLabel?.text = menuArray[indexPath.row]
            return menuCell
        }else {
            return UITableViewCell()
        }
    }
    
    //MARK: UITableViewDelegate Methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == menuTableView {
            if indexPath.row == 0 {
                handleMenu()
            } else if indexPath.row == 1 {
                if let favoriteViewControllerObj = storyboard?.instantiateViewController(withIdentifier: "FavoriteViewController") as? FavoriteViewController {
                    guard let items = DBHelper().display() else {
                        return
                    }
                    favoriteViewControllerObj.items = items
                    navigationController?.pushViewController(favoriteViewControllerObj, animated: true)
                }
            } else if indexPath.row == 2 {
                if let allGamesViewControllerObj = storyboard?.instantiateViewController(withIdentifier: "AllGamesViewController") as? AllGamesViewController {
                    navigationController?.pushViewController(allGamesViewControllerObj, animated: true)
                }
            }
        }
    }

}
