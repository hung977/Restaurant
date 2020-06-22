//
//  MenuTableViewController.swift
//  Restaurant
//
//  Created by TPS on 6/22/20.
//  Copyright © 2020 TPS. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
    var menuController = MenuController()
    var menuItems = [MenuItem]()
    var category: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = category.capitalized
        menuController.fetchMenuItems(forCategory: category) { (menuItems) in
            if let menuItems = menuItems {
                self.updateUI(with: menuItems)
            }
        }

        
    }
    func updateUI(with menuItems: [MenuItem]) {
        DispatchQueue.main.async {
            self.menuItems = menuItems
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView,
    numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt
    indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:
           "MenuCellIdentifier", for: indexPath)
        configure(cell, forItemAt: indexPath)
        return cell
    }
    
    func configure(_ cell: UITableViewCell, forItemAt indexPath:
    IndexPath) {
        let menuItem = menuItems[indexPath.row]
        cell.textLabel?.text = menuItem.name
        cell.detailTextLabel?.text = "$\(menuItem.price)"
    }
}
