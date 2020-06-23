//
//  MenuItem.swift
//  Restaurant
//
//  Created by TPS on 6/22/20.
//  Copyright © 2020 TPS. All rights reserved.
//

import Foundation

struct MenuItem: Codable {
    var id: Int
    var name: String
    var description: String
    var price: Double
    var category: String
    var image_url: URL
    
    enum codingKeys: String, CodingKey {
        case id
        case name
        case description
        case price
        case category
        case image_url
    }
}

struct MenuItems: Codable {
    let items: [MenuItem]
}
