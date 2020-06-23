//
//  MenuItemDetailViewController.swift
//  Restaurant
//
//  Created by TPS on 6/22/20.
//  Copyright © 2020 TPS. All rights reserved.
//

import UIKit

class MenuItemDetailViewController: UIViewController {

    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var detailTextLabel: UILabel!
    @IBOutlet weak var addToOrderButton: UIButton!
    var menuItem: MenuItem!
    
    override func viewDidLoad() {
        addToOrderButton.layer.cornerRadius = 5.0
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    func updateUI() {
        titleLabel.text = menuItem.name
        priceLabel.text = String(format: "$%.2f", menuItem.price)
        detailTextLabel.text = menuItem.description
    }
    @IBAction func addToOrderButtonTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
                self.addToOrderButton.transform =
                    CGAffineTransform(scaleX: 3.0, y: 3.0)
                self.addToOrderButton.transform =
                CGAffineTransform(scaleX: 1.0, y: 1.0)
            }
        MenuController.shared.order.menuItems.append(menuItem)
    }
    

}
