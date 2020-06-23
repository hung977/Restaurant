//
//  IntermediaryModels.swift
//  Restaurant
//
//  Created by TPS on 6/22/20.
//  Copyright © 2020 TPS. All rights reserved.
//

import Foundation

struct Categories: Codable {
    let categories: [String]
}
struct PreparationTime: Codable {
    let prepTime: Int
    
    enum CodingKeys: String, CodingKey {
        case prepTime = "preparation_time"
    }
}
