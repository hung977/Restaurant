//
//  CategoryTableTableViewController.swift
//  Restaurant
//
//  Created by TPS on 6/22/20.
//  Copyright © 2020 TPS. All rights reserved.
//

import UIKit

class CategoryTableTableViewController: UITableViewController {
    var categories = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Menu"
        MenuController.shared.fetchCategories{(categories) in
            if let categories = categories {
                self.updateUI(with: categories)
            }
        }
    }
    func updateUI(with categories: [String]) {
        DispatchQueue.main.async {
            self.categories = categories
            self.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MenuSegue" {
            let menuTableViewController = segue.destination as! MenuTableViewController
            let index = tableView.indexPathForSelectedRow!.row
            menuTableViewController.category = categories[index]
        }
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categories.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt
    indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"CategoryCellIdentifier", for: indexPath)
        configure(cell, forItemAt: indexPath)
        return cell
    }
    
    func configure(_ cell: UITableViewCell, forItemAt indexPath:
    IndexPath) {
        let categoryString = categories[indexPath.row]
        //print(categoryString)
        cell.textLabel?.text = categoryString.capitalized
    }
    
}
