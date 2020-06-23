//
//  Order.swift
//  Restaurant
//
//  Created by TPS on 6/22/20.
//  Copyright © 2020 TPS. All rights reserved.
//

import Foundation

struct Order: Codable {
    var menuItems: [MenuItem]
    
    init(menuItems: [MenuItem] = []) {
        self.menuItems = menuItems
    }
}
